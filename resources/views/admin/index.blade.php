@extends('layouts.app')

@section('content')

<div class="container">
    <h3>Loan Details</h3><br>
    <table class="table table-bordered mt-8">
        <thead>
            <tr>
                <th>Client ID</th>
                <th>Number of Payments</th>
                <th>First Payment Date</th>
                <th>Last Payment Date</th>
                <th>Loan Amount</th>
            </tr>
        </thead>
        <tbody>
            @foreach($loanDetails as $loan)
            <tr>
                <td>{{ $loan->clientid }}</td>
                <td>{{ $loan->num_of_payment }}</td>
                <td>{{ \Carbon\Carbon::parse($loan->first_payment_date)->format('Y-m-d') }}</td>
                <td>{{ \Carbon\Carbon::parse($loan->last_payment_date)->format('Y-m-d') }}</td>
                <td>{{ number_format($loan->loan_amount, 2) }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <!-- Button to Process EMI Data -->
    <form action="/process" method="POST">
        @csrf
        <button type="submit" class="btn btn-primary">Process Data</button>
    </form>
</div>

@endsection