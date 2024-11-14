<?php

namespace App\Services;

use App\Repositories\LoanDetailsRepository;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class LoanService
{
    protected $loanRepository;

    public function __construct(LoanDetailsRepository $loanRepository)
    {
        $this->loanRepository = $loanRepository;
    }

    public function processLoanData()
    {
        $loans = $this->loanRepository->getAllLoans();
        $minDate = $this->loanRepository->getMinFirstPaymentDate();
        $maxDate = $this->loanRepository->getMaxLastPaymentDate();

        // Generate dynamic columns
        $columns = $this->generateDynamicColumns($minDate, $maxDate);

        // Create/Reset the emi_details table
        DB::statement('DROP TABLE IF EXISTS emi_details');
        $createTableQuery = $this->generateEmiTableSchema($columns);
        DB::statement($createTableQuery);

        foreach ($loans as $loan) {
            $this->insertEmiDetails($loan, $columns);
        }
    }

    private function generateDynamicColumns($minDate, $maxDate)
    {
        $start = new \DateTime($minDate);
        $end = new \DateTime($maxDate);
        $columns = [];

        while ($start <= $end) {
            $columns[] = $start->format('Y_M');
            $start->modify('+1 month');
        }

        return $columns;
    }

    private function generateEmiTableSchema($columns)
    {
        $columnsSchema = implode(' DECIMAL(10, 2) DEFAULT 0.00, ', $columns) . ' DECIMAL(10, 2) DEFAULT 0.00';
        return "CREATE TABLE emi_details (clientid INT, $columnsSchema)";
    }

    private function insertEmiDetails($loan, $columns)
    {
        $emiAmount = round($loan->loan_amount / $loan->num_of_payment, 2);
        $remainingAmount = $loan->loan_amount;
        $data = ['clientid' => $loan->clientid];

        $currentDate = Carbon::parse($loan->first_payment_date);

        foreach ($columns as $month) {
          // Check if the current month is within the loan period
          if ($currentDate->format('Y_M') === $month && $remainingAmount > 0) {
            $data[$month] = min($emiAmount, $remainingAmount);
            $remainingAmount -= $data[$month];
            $currentDate->addMonth(); // Move to the next month
        } else {
            $data[$month] = 0;
        }
        }

        DB::table('emi_details')->insert($data);
    }
}
