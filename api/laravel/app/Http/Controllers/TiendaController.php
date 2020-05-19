<?php

namespace App\Http\Controllers;
use Auth;
//use App\Auth;
use App\Tienda;
use DB;
use App\User;
use Illuminate\Http\Request;

class TiendaController extends Controller
{

    /*
     * Listar todas
     */
    public function listar() {

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
    public function ver(Request $Request) {

        Tienda::findOrFail($Request->id);
        return 'Hola';

    }

}
