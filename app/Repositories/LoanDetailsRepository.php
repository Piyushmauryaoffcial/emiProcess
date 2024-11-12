<?php

namespace App\Repositories;

use Illuminate\Support\Collection;

interface LoanDetailsRepository
{
    public function getAllLoans(): Collection;
    public function getMinFirstPaymentDate(): string;
    public function getMaxLastPaymentDate(): string;
}
