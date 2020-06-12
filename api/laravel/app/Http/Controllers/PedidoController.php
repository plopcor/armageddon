<?php

namespace App\Http\Controllers;

use App\Favorito;
use App\Suscripcion;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
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
        $pedido = $this->recuperarPedidoPropioById($request->id);
        return $this->sendResponse($pedido);
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
            'recogida' => 'required|date|after_or_equal:today'
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
            'recogida' => $request->recogida //date("Y-m-d H:i:s")
        ]);

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

    /**
     * Pagar
     */
    public function pagar(Request $request)
    {
        $pedido = $this->recuperarPedidoPropioByIdSinEager($request->id)->load('tienda');
        //$pedido = $this->recuperarPedidoPropioById($request->id);

        // Si no esta pagado
        if($pedido->estado != "PAGADO") {
            $pedido->estado = "PAGADO";
        }

        // Generar Codigo QR
        if($pedido->codigo_qr == null) {

            // Generar codigo QR
            $datos = $pedido->id;
            $fichero = '/qrcodes/' . md5($pedido->id) . ".png";
            $ruta = public_path($fichero);

            QrCode::margin(0)->format('png')->size(400)->color(112, 118, 227)->generate($datos, $ruta);
            //QrCode::margin(0)->format('png')->size(400)->color(112, 118, 227)->generate('Hallo', $ruta);

            $pedido->codigo_qr = $fichero;
        }

        // Guardar
        if($pedido->save()) {
            return $this->sendResponse($pedido);
        } else {
            return $this->sendErrorDatabase();
        }

    }

}
