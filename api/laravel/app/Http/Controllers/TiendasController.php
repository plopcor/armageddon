<?php

namespace App\Http\Controllers;

use App\Favorito;
use Illuminate\Http\Request;
use Auth;
use DB;
use App\User;
use App\Tienda;
use App\ProductoTienda;
use App\Producto;
use Illuminate\Support\Facades\Validator;
use App\Traits;


class TiendasController extends APIController
{
    use Traits\RecuperarConExcepciones;

    /**
     * Listar
     */
    public function listar()
    {
        $tiendas = Tienda::all();
        return $this->sendResponse($tiendas);
    }

    /**
     * Ver
     */
    public function ver(Request $request)
    {
        $tienda = $this->recuperarTiendaById($request->id);
        return $this->sendResponse($tienda);
    }

    /**
     * Filtrar por localizacion
     */
    public function filtrar(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'longitud' => 'required_with:latitud|numeric|between:-180,180',
            'latitud' => 'required_with:latitud|numeric|between:-90,90',
            'radio' => 'numeric',
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        // Default Radio
        $request['radio'] = $request->radio ?? 5;

        // Filtrar tiendas por localizacion
        $tiendas = Tienda::cercaDe($request, $request->radio)->get();

        return $this->sendResponse($tiendas);
    }

    // ------------------------------------------------------------------
    // Productos
    // ------------------------------------------------------------------
    /**
     * Listar productos
     */
    public function productos_listar(Request $request)
    {
        $tienda = $this->recuperarTiendaById($request->id);
        $productos = $tienda->productos->load('producto');
        return $this->sendResponse($productos);
    }

    /**
     * Ver producto
     */
    public function productos_ver(Request $request)
    {
        $tienda = $this->recuperarTiendaById($request->id);
        $producto = $tienda->productos->where('id', $request->idProducto)->first();

        if($producto == null) {
            return $this->sendErrorNotFound("La tienda no contiene este producto");
        }
//        else {
//              // Cargar producto base (con los datos como nombre, imagen, etc)
//            $producto->with('producto');
//        }

        return $this->sendResponse($producto);
    }

    // ------------------------------------------------------------------
    // Horario
    // ------------------------------------------------------------------
    public function horario_ver()
    {
        // TODO
    }

    // ------------------------------------------------------------------
    // Pedidos
    // ------------------------------------------------------------------

    /**
     * Listar
     */
    public function pedidos_listar(Request $request)
    {
        // TODO => Test
        $tienda = $this->recuperarTiendaById($request->id);
        $pedidos = Auth::user()->pedidos->where('id_tienda', $tienda->id);
        //$pedidos = Pedido::where('id_tienda', $tienda->id);

        return $this->sendResponse($pedidos);
    }

    /**
     * Ver
     */
    public function pedidos_ver()
    {
        // TODO
    }





    // ------------------------------------------------------------------
    // Pedidos Favoritos
    // ------------------------------------------------------------------

    /**
     * Listar pedidos favoritos de la Tienda
     */
    public function favoritos_listar(Request $request)
    {
        $tienda = $this->recuperarTiendaById($request->id);
        $favoritos = Auth::user()->favoritos->where('id_tienda', $tienda->id)->load('pedido');

        return $this->sendResponse($favoritos);
    }

    /**
     * Crear / Añadir pedido a favoritos
     */
    public function favoritos_crear(Request $request)
    {
        // TODO
    }


    public function test()
    {

        $tienda = $this->recuperarTiendaById(2);
        $productos = $tienda->productos;
        return $this->sendResponse($productos);


        //$p = Producto::where('id', 3)->first();

        // Devolver todos los productos de las tiendas
        //$tienda = $this->recuperarTiendaById(1);
        //$productos = ProductoTienda::where('id_tienda', 1)->get();
        //return $this->sendResponse($productos);
    }

    /**
     *
     */

}
