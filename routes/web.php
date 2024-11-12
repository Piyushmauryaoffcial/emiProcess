<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\LoanController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [AuthController::class, 'showLoginForm']);
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);

// Apply 'auth' middleware to a group of routes
Route::middleware(['auth'])->group(function () {


Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/emi', [LoanController::class, 'showEmi']);
Route::get('/loan_details', [LoanController::class, 'index'])->name("loan_details");
Route::post('/process', [LoanController::class, 'processData']);

});