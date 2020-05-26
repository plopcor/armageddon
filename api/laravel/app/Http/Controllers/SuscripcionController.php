<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class SuscripcionController extends APIController
{
    /**
     * Listar
     */
    public function listar()
    {
        $suscripciones = Auth::user()->suscripciones;
        foreach($suscripciones as $suscripcion) {
            $suscripcion->tienda;
        }
        return $this->sendResponse($suscripciones);
    }


    /**
     * Crear
     */

    /**
     * Eliminar
     */
}
