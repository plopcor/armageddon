<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use App\User;
use App\Tienda;


class TiendaController extends APIController
{

    /*
     * Listar todas
     */
    public function listar()
    {
        $tiendas = array();
        foreach(Tienda::all() as $tienda) {

            $item = $tienda;
            $tienda->propietario;

            $tiendas[] = $item;
        }

        return json_encode($tiendas);
    }

    /*
     * Ver tienda especifica
     */
    public function ver(Request $Request)
    {
        $tienda = Tienda::findOrFail($Request->id);
        return $this->sendResponse($tienda);
    }

}
