<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

use Illuminate\Support\Facades\Auth;

class AuthCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {

// Check if the user is authenticated
if (!Auth::check()) {
    // Redirect to the login page if not authenticated
    return redirect()->route('login')->with('error', 'You must be logged in to access this page.');
}

        return $next($request);
    }
}