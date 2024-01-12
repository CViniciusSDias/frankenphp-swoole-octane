<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/health-check', fn (Request $request) => Response::noContent())->name('health-check');
Route::get('/static', fn (Request $request) => Response::json(['status' => true]))->name('static');
Route::get(
    '/http-request',
    fn (Request $request) => Http::get('http://whoami/api')
)->name('http-request');
Route::get('/db-operation', fn (Request $request) => Response::json(DB::select('SELECT pg_sleep(0.1);')));
