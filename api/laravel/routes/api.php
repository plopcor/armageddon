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
    Route::get('/token', 'UsuarioController@verificar_token')->middleware('auth:api'); // Probar el token


    /**
     * USUARIO
     */
    Route::group(['prefix' => 'usuario', 'middleware'=>'auth:api'], function () {

        // Informacion
        Route::get('/', 'UsuarioController@info');

        // Subscripciones
        Route::get('/suscripciones', 'SuscripcionController@listar');
        //Route::post('/suscripcion/{id}', 'SuscripcionController@crear'); ===> /v1/tienda/{id}/suscripcion
        Route::delete('/suscripcion/{id}', 'SuscripcionController@eliminar');

        // Favoritos
        Route::get('/favoritos', 'FavoritoController@listar');              // Listar
        Route::post('/pedido/{id}/favorito', 'FavoritoController@crear');   // Crear (Añadir Pedido a Favoritos)
        Route::delete('/favorito/{id}', 'FavoritoController@eliminar');     // Eliminar (Quitar Pedido de Favoritos)

        // Pedidos
        Route::get('/pedidos', 'PedidoController@listar');
        Route::get('/pedido/{id}', 'PedidoController@ver');
        //Route::post('/pedido', 'Controller@crear');
        Route::put('/pedido/{id}', 'PedidoController@editar');
        //Route::delete('//{id}', 'Controller@eliminar');

    });


    /**
     * TIENDA - Propia (como propietario de la tienda)
     */
    Route::group(['prefix' => 'tienda', 'middleware' => 'auth:api'], function () {

        // Tienda
        Route::get('/', 'TiendaPropiaController@ver');          // Ver
        Route::post('/', 'TiendaPropiaController@crear');       // Crear
        Route::put('/', 'TiendaPropiaController@editar');       // Editar
        Route::delete('/', 'TiendaPropiaController@eliminar');  // Eliminar

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

    // Listar tiendas
    Route::get('/tiendas', 'TiendasController@listar')->middleware('auth:api');;

    /**
     * TIENDA - Otras (como usuario de la aplicacion)
     */

    Route::group(['prefix' => 'tienda/{id}', 'middleware' => 'auth:api'], function () {

        // Tienda
        Route::get('/', 'TiendasController@ver');   // Ver (Informacion de la Tienda)

        // Productos
        Route::get('/productos', 'TiendasController@productos_listar');             // Listar (Productos de la Tienda)
        Route::get('/producto/{idProducto}', 'TiendasController@productos_ver');    // Ver (Producto de la Tienda)

        // Categorias
        Route::get('/categorias', 'TiendasController@categorias_listar');           // Listar (Categorias de la tienda)

        // Horario
        Route::get('/horario', 'TiendasController@horario_ver');        // Ver  (Horario de la Tienda)

        // Pedidos
        Route::get('/pedidos', 'TiendasController@pedidos_listar');     // Listar (Pedidos realizados en la Tienda)
        //Route::get('/pedido/{idPedido}', 'TiendasController@pedidos_ver');            ===> v1/usuario/pedido/{id}
        Route::post('/pedido', 'TiendasController@pedidos_crear');      // Crear (Pedido en esa Tienda)
        //Route::put('/pedido/{idPedido}', 'TiendasController@pedidos_editar');         ===> v1/usuario/pedido/{id}
        //Route::delete('/pedido/{idPedido}', 'TiendasController@pedidos_eliminar');    ===> v1/usuario/pedido/{id}/

        // Pedidos Favoritos
        Route::get('/pedidos/favoritos', 'TiendasController@favoritos_listar');             // Listar (Pedidos Favoritos de la tienda)
        //Route::post('/pedido/{idPedido}/favorito', 'TiendasController@favoritos_crear');  ===> /v1/usuario/pedidos/{id}/favorito  // Crear (Pedido Favorito)

    });


    /**
     * PRODUCTOS
     */
    Route::get('/productos', 'ProductoController@listar');      // Listar
    Route::get('/producto/{id}', 'ProductoController@ver');     // Ver

    /**
     *
     */

    /**
     * TEST
     */
    Route::get('/test', 'TiendasController@test');

});




