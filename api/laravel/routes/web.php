<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

/**
 * PANEL principal
 */
Route::get('/', function () {
    if(Auth::check()) {
        return view('panel');
    } else {
        return redirect('login');
    }
});

Auth::routes();

/**
 * TIENDA PROPIA
 */
Route::group(['prefix' => 'tienda', 'middleware' => 'auth'], function () {

    // Tienda
    Route::get('/', 'WebControllers\TiendaPropiaController@ver')->name('tienda');

    // Productos
    Route::get('/productos', 'WebControllers\TiendaPropiaController@productos')->name('productos');

    // Horario
    Route::get('/horario', 'WebControllers\TiendaPropiaController@horario')->name('horario');

    // Pedidos
    Route::get('/pedidos', 'WebControllers\TiendaPropiaController@productos')->name('pedidos');

    // Clientes
    Route::get('/clientes', 'WebControllers\TiendaPropiaController@clientes')->name('clientes');

    // Estadisticas
    Route::get('/estadisticas', 'WebControllers\TiendaPropiaController@estadisticas')->name('estadisticas');

});

/**
 * USUARIO
 */
Route::group(['prefix' => 'usuario'], function () {

    // Perfil
    Route::get('/', 'WebController\UsuarioController@perfil')->name('usuario');
});

