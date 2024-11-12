
@extends('layouts.app')

@section('content')

<div class="container">
    <h2>EMI Details</h2>

    @if($emiDetails->isEmpty())
        <p>No EMI data available. Please process the data first.</p>
    @else
    <div class="table-responsive">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Client ID</th>
                @foreach(array_keys((array) $emiDetails->first()) as $column)
                    @if($column !== 'clientid')
                        <th>{{ $column }}</th>
                    @endif
                @endforeach
            </tr>
        </thead>
        <tbody>
            @foreach($emiDetails as $emi)
            <tr>
                <td>{{ $emi->clientid }}</td>
                @foreach(array_keys((array) $emi) as $key)
                    @if($key !== 'clientid')
                        <td>{{ number_format($emi->$key, 2) }}</td>
                    @endif
                @endforeach
            </tr>
            @endforeach
        </tbody>
    </table>
    @endif
</div>
</div>

@endsection