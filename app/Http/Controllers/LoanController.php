<?php

namespace App\Http\Controllers;

use App\Services\LoanService;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class LoanController extends Controller
{
    protected $loanService;

    public function __construct(LoanService $loanService)
    {
        $this->loanService = $loanService;
    }

    public function index()
    {
        $loanDetails = DB::table('loan_details')->get();
        return view('admin.index', compact('loanDetails'));
    }

    public function showEmi()
    {
        $emiDetails = DB::table('emi_details')->get();
        return view('admin.emi', compact('emiDetails'));
    }

    public function processData()
    {
        $this->loanService->processLoanData();
        return redirect('/emi');
    }
}
