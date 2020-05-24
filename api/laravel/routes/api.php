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

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

// AGRUPAR Y USAR MIDDLEWARE
//Route::middleware('auth:api')->group( function () {
//    Route::get('/productos', 'ProductoController@listar');
//});

// Rutas API (Version 1)
Route::group(['prefix' => 'v1'], function () {

    // @ Autenticacion
    Route::post('/login', 'UsuarioController@login');
    Route::post('/register', 'UsuarioController@register');
    Route::get('/logout', 'UsuarioController@logout')->middleware('auth:api');
    Route::get('/token', 'UsuarioController@tokenTest')->middleware('auth:api'); // Probar el token

    // @ Tiendas
    Route::get('/tiendas', 'TiendaController@listar');
    Route::get('/tienda/{id}', 'TiendaController@ver');
    Route::post('/tienda', 'TiendaController@crear');

    // @ Productos
    Route::get('/productos', 'ProductoController@listar');
    Route::get('/producto/{id}', 'ProductoController@ver');

    // @ Categorias
    Route::get('/categorias', 'CategoriaController@listar');
    Route::get('/categoria/{id}', 'CategoriaController@ver');
    Route::get('/categoria/{id}/productos', 'CategoriaController@verProductos');

});




