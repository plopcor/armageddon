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
Route::get('/tiendas', 'TiendasController@listarTiendas');
Route::get('/tienda/{id}', 'TiendasController@verTienda');
Route::post('/tienda', 'TiendasController@crearTienda');


/*
Route::get('/home', 'HomeController@index')->name('home');
Route::get('/hola', 'PracticasController@hola');
Route::get('/misPracticas', 'PracticasController@verMisPracticas');
Route::get('/newPractica', 'PracticasController@entregarPractica');
Route::post('/newPractica', 'PracticasController@subirPractica');
//esto signfica que cuando vayas a /corrigePractica/1, va a ir a PracticasController, funcion corrigePractica, y le pasaras como parámetro un int 1
Route::get('/corrigePractica/{practica}', 'PracticasController@corrigePractica');
*/