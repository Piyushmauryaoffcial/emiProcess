<?php

namespace App\Repositories;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;

class LoanDetailsRepositoryImpl implements LoanDetailsRepository
{
    public function getAllLoans(): Collection
    {
        return DB::table('loan_details')->get();
    }

    public function getMinFirstPaymentDate(): string
    {
        return DB::table('loan_details')->min('first_payment_date');
    }

    public function getMaxLastPaymentDate(): string
    {
        return DB::table('loan_details')->max('last_payment_date');
    }
}
