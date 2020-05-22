<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Producto;

class ProductoController extends APIController
{
    /*
     * Listar productos
     */
    public function listar()
    {
        return $this->sendResponse(Producto::all());
    }

    /*
     * Ver producto especifico
     */
    public function ver(Request $Request)
    {
        $producto = Producto::findOrFail($Request->id);
        return $this->sendResponse($producto);
    }


}
