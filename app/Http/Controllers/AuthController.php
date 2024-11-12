<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
        // Show the login form
        public function showLoginForm()
        {
            return view('auth.login');
        }
    
        // Handle login
        public function login(Request $request)
        {
            $request->validate([
                'username' => 'required',
                'password' => 'required'
            ]);
    
            // Attempt to authenticate using username and password
            if (Auth::attempt(['username' => $request->username, 'password' => $request->password])) {
                return redirect()->route('loan_details');
            }
    
            // If authentication fails, redirect back with an error
            return redirect()->back()->with('error', 'Invalid username or password.');
        }
    
       
    
        // Handle logout
        public function logout()
        {
            Auth::logout();
            return redirect('/login');
        }
}
