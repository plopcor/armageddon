<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Categoria;

class CategoriaController extends APIController
{
    /*
     * Listar categorias
     */
    public function listar()
    {
        return $this->sendResponse(Categoria::all());
    }

    /*
     * Ver categoria especifica
     */
    public function ver(Request $request)
    {
        $categoria = Categoria::findOrFail($request->id);

        return $this->sendResponse($categoria);
    }

    /*
     * Ver productos con esa categoria
     */
    public function verProductos(Request $request)
    {
        $categoria = Categoria::findOrFail($request->id);

        return $this->sendResponse($categoria->productos);
    }


}
