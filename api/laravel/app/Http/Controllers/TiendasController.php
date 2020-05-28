<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use App\User;
use App\Tienda;
use App\ProductoTienda;
use App\Producto;


class TiendasController extends APIController
{

    private function recuperarTiendaById($idTienda)
    {
        // Recuperar la tienda por ID
        $tienda = Tienda::where('id', $idTienda)->first();

        if($tienda == null) {
            $this->sendErrorNotFound("Tienda no encontrada")->send();
            exit();
        }

        return $tienda;
    }

    // ------------------------------------------------------------------

    /**
     * Listar
     */
    public function listar()
    {
        return $this->sendResponse(Tienda::all());
    }

    /**
     * Ver
     */
    public function ver(Request $request)
    {
        $tienda = $this->recuperarTiendaById($request->id);
        return $this->sendResponse($tienda);
    }

    // ------------------------------------------------------------------
    // Productos
    // ------------------------------------------------------------------
    /**
     * Listar
     */
    public function productos_listar(Request $request)
    {
        $tienda = $this->recuperarTiendaById($request->id);
        $productos = $tienda->productos;
        return $this->sendResponse($productos);
    }

    /**
     * Ver
     */
    public function productos_ver(Request $request)
    {
        $tienda = $this->recuperarTiendaById($request->id);
        $producto = $tienda->productos->where('id', $request->idProducto)->first();

        if($producto == null) {
            return $this->sendErrorNotFound("La tienda no contiene este producto");
        }

        return $this->sendResponse($producto);
    }



}
