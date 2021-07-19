<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([ 'prefix' => 'auth'], function (){ 
    Route::group(['middleware' => ['guest:api']], function () {
        Route::post('login', 'API\AuthController@login');
        Route::post('signup', 'API\AuthController@signup');
    });
    Route::group(['middleware' => 'auth:api'], function() {
        Route::get('logout', 'API\AuthController@logout');
        Route::get('getuser', 'API\AuthController@getUser');
    });
}); 

Route::group(['middleware' => 'auth:api'], function() {
    Route::group(['prefix' => 'post'], function (){ 
        Route::get('/','API\PostController@index');
        Route::post('/store','API\PostController@store');
        Route::post('/edit','API\PostController@update');
    });     
    Route::group(['prefix' => 'comment'], function (){ 
        Route::get('/{id}','API\PostController@detail');
        Route::post('/store','API\PostController@storeComment');
    });    
    Route::group(['prefix' => 'like'], function (){ 
        Route::post('/store','API\PostController@likePosts');
        Route::get('/show/{post}','API\PostController@showLike');
    });     

});

