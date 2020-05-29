<?php

namespace App\Http\Controllers;

use App\Favorito;
use App\Suscripcion;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Validator;
use App\Tienda;
use App\Pedido;
use App\Traits;

class PedidoController extends APIController
{
    use Traits\RecuperarConExcepciones;

    /**
     * Listar
     */
    public function listar()
    {
        $pedidos = Auth::user()->pedidos;
        return $this->sendResponse($pedidos);
    }

    /**
     * Ver
     */
    public function ver(Request $request)
    {
        $pedido = Auth::user()->pedidos->where('id_pedido', $request->id);
        return $pedido;
    }

    /**
     * Crear
     */
    public function pedidos_crear(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'productos' => 'required|array|min:1',
            'productos.*.id' => 'required|integer',
            'productos.*.cantidad' => 'required|integer',
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        // Recuperar Tienda y sus Productos
        $tienda = $this->recuperarTiendaById($request->id);
        $productosTienda = $tienda->productos;

        // Generar Pedido
        $pedido = Pedido::create([
            'id_usuario' => Auth::user()->id,
            'id_tienda' => $tienda->id,
            'estado' => "CREADO",
            'recogida' => date("Y-m-d H:i:s")
        ]);
//        $pedido = new Pedido;
//        $pedido->id = 2;
//        $pedido->id_usuario = Auth::user()->id;
//        $pedido->id_tienda = $tienda->id;
//        $pedido->estado = "CREADO";

        // Recuperar Productos de la comanda
        foreach($request->productos as $comanda) {

            // Recuperar producto de la tienda
            $producto = $productosTienda->find($comanda['id']);
            if($producto == null) {
                return $this->sendErrorNotFound("Producto con ID " . $comanda['id'] . " no encontrado en la tienda con ID " . $tienda->id);
            }
//            // Recuperar producto =====> METODO 2
//            if(!$productosTienda->contains($comanda['id'])) {
//                return $this->sendErrorNotFound("Producto con ID " . $comanda['id'] . " no encontrado en la tienda con ID " . $tienda->id);
//            }

            // Añadir al Pedido
            $pedido->productos()->attach($producto, ['cantidad' => $comanda['cantidad'], 'precio_unidad' => $producto->precio]);
        }

        return $this->sendResponse($pedido);
    }


//    /**
//     * Crear
//     */
//    public function crear(Request $request)
//    {
//        // Recuperar pedido
//        $pedido = Auth::user()->pedidos->find($request->id);
//        if($pedido == null) {
//            return $this->sendErrorNotFound("No existe el pedido con ID " . $request->id);
//        }
//
//        // Comprovar si ya existe el favorito
//        $favorito = Auth::user()->favoritos->where('id_pedido')->first();
//        if($favorito == null) {
//
//            $favorito = Favorito::create([
//                'nombre' => '',
//                'id_usuario' => Auth::user()->id,
//                'id_pedido' => $pedido->id
//            ]);
//
//            if($favorito->save()) {
//                return $this->sendOk();
//            } else {
//                return $this->sendErrorDatabase();
//            }
//        }
//
//        return $this->sendOk();
//    }

//    /**
//     * Eliminar
//     */
//    public function eliminar(Request $request)
//    {
//        $favorito = Auth::user()->favoritos->find($request->id);
//        if($favorito != null) {
//
//            // Eliminar
//            if($favorito->delete()) {
//                return $this->sendOk();
//            } else {
//                return $this->sendErrorDatabase();
//            }
//
//        } else {
//            return $this->sendErrorNotFound("No existe un favorito con ID " . $request->id);
//        }
//    }
}
