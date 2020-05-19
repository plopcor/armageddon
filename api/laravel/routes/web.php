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


Route::get('/', function () {
    return view('welcome');
});


Auth::routes();


// RUTAS
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
