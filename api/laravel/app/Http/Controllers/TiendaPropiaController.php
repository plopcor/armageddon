<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use App\User;
use App\Tienda;


class TiendaPropiaController extends APIController
{

    /**
     * Recuperar Tienda del usuario logeado
     *
     * @return \Illuminate\Http\Response
     * @return \App\Tienda
     */
    private function recuperarTiendaPropia()
    {
        $tienda = Tienda::where('id_propietario', Auth::user()->id);
        if($tienda == null) {
            return $this->sendErrorNotFound("El usuario no tiene ninguna tienda");
        }
        return $tienda;
    }

    /**
     * Ver
     */
    public function ver()
    {
        return $this->sendResponse($this->recuperarTiendaPropia());
    }

    /**
     * Editar
     */
    public function editar(Request $request)
    {
        $tienda = recuperarTiendaPropia();

        // TODO
    }

}
