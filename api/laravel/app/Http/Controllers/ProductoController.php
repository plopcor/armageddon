<?php

namespace App\Http\Controllers;

use App\ProductoTienda;
use Illuminate\Http\Request;

class ProductoController extends APIController
{
    /**
     * Listar
     */
    public function listar()
    {
        return $this->sendResponse(ProductoTienda::all()->load('producto'));
    }

    /**
     * Ver
     */
    public function ver(Request $Request)
    {
        $producto = ProductoTienda::findOrFail($Request->id)->load('producto');
        return $this->sendResponse($producto);
    }


}
