<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Categoria;

class CategoriaController extends Controller
{
    /*
     * Ver todas las categorias
     */
    public function listar() {

        return json_encode(Categoria::all());

    }

    /*
     * Ver categoria especifica
     */
    public function ver(Request $request) {

        $categoria = Categoria::findOrFail($request->id);
        return json_encode($categoria);

    }

    /*
     * Ver los productos que tienen esa categoria
     */
    public function verProductos(Request $request) {

        $categoria = Categoria::findOrFail($request->id);
        $productos = array();

        foreach($categoria->productos as $producto) {
            $productos[] = $producto->nombre;
        }

        return json_encode($productos);
    }


}
