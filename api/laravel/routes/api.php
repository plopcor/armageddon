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

    /**
     * AUTENTICACION
     */
    Route::post('/login', 'UsuarioController@login');
    Route::post('/register', 'UsuarioController@register');
    Route::get('/logout', 'UsuarioController@logout')->middleware('auth:api');
    // TEST
    Route::get('/token', 'UsuarioController@tokenTest')->middleware('auth:api'); // Probar el token


    /**
     * USUARIO
     */
    Route::group(['prefix' => 'usuario', 'middleware'=>'auth:api'], function () {

        // Informacion
        Route::get('/', 'UsuarioController@info');

        // Subscripciones
        Route::get('/suscripciones', 'SuscripcionController@listar');
        Route::post('/suscripcion/{id}', 'SuscripcionController@crear');
        Route::delete('/suscripcion/{id}', 'SuscripcionController@eliminar');

        // Favoritos
        Route::get('/favoritos', 'Controller@listar');
        Route::get('/favorito/{id}', 'Controller@ver');
        Route::post('/favorito', 'Controller@crear');
        Route::put('/favorito/{id}', 'Controller@editar');
        Route::delete('/favorito/{id}', 'Controller@eliminar');

        // Pedidos
        Route::get('/pedidos', 'Controller@listar');
        Route::get('/pedido/{id}', 'Controller@ver');
        //Route::post('/pedido', 'Controller@crear');
        Route::put('/pedido/{id}', 'Controller@editar');
        //Route::delete('//{id}', 'Controller@eliminar');

    });


    /**
     * TIENDA - Propia (como propietario de la tienda)
     */
    Route::group(['prefix' => 'tienda', 'middleware' => 'auth:api'], function () {

        // Tienda
        Route::get('/', 'Controller@ver');          // Ver
        Route::post('/', 'Controller@crear');       // Crear
        Route::put('/', 'Controller@editar');       // Editar
        Route::delete('/', 'Controller@eliminar');  // Eliminar

        // Productos
        Route::get('/productos', 'Controller@listar');              // Listar
        Route::get('/producto/{idProducto}', 'Controller@ver');     // Ver
        Route::post('/producto', 'Controller@crear');               // Crear
        Route::put('/producto/{idProducto}', 'Controller@editar');          // Editar
        Route::delete('/producto/{idProducto}', 'Controller@eliminar');     // Eliminar

        // Categorias
        Route::get('/categorias', 'Controller@listar');
        Route::post('/categoria', 'Controller@crear');
        Route::delete('/categoria/{idCategoria}', 'Controller@eliminar');

        // Horario
        Route::get('/horario', 'Controller@ver');
        Route::post('/horario', 'Controller@crear');
        Route::put('/horario', 'Controller@editar');
        Route::delete('/horario', 'Controller@eliminar');

        // Pedidos
        Route::get('/pedidos', 'Controller@listar');
        Route::get('/pedido/{idPedido}', 'Controller@ver');

    });

    /**
     * TIENDA - Otras (como usuario de la aplicacion)
     */

    // Tiendas
    Route::get('/tiendas', 'TiendaController@listar')->middleware('auth:api');;

    Route::group(['prefix' => 'tienda/{id}', 'middleware' => 'auth:api'], function () {

        // Tienda
        Route::get('/', 'Controller@ver');

        // Productos
        Route::get('/productos', 'Controller@listar');
        Route::get('/producto/{idProducto}', 'Controller@ver');

        // Categorias
        Route::get('/categorias', 'Controller@listar');

        // Horario
        Route::get('/horario', 'Controller@listar');

        // Pedido
        Route::get('/pedidos', 'Controller@listar');
        Route::get('/pedido/{idPedido}', 'Controller@ver');
        Route::post('/pedido', 'Controller@crear');
        Route::put('/pedido/{idPedido}', 'Controller@editar');
        Route::delete('/pedido/{idPedido}', 'Controller@eliminar');

    });

});




