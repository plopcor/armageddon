<?php

namespace App\Http\Controllers;

use App\Suscripcion;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Validator;
use App\Tienda;
use App\Traits;

class SuscripcionController extends APIController
{
    use Traits\RecuperarConExcepciones;

    /**
     * Listar
     */
    public function listar()
    {
        $suscripciones = Auth::user()->suscripciones;
        return $this->sendResponse($suscripciones);
    }

    /**
     * Crear
     */
    public function crear(Request $request)
    {
        $idUsuario = Auth::user()->id;

        // Comprovar que la tienda existe
        $tienda = $this->recuperarTiendaById($request->id);

        // Comprovar que no esta suscrito ya
        $suscripcion = Auth::user()->suscripciones()->where('id_tienda', $tienda->id)->first();
        if($suscripcion == null) {

            // Crear suscripcion
            $suscripcion = Suscripcion::create([
                'id_usuario' => $idUsuario, 'id_tienda' => $tienda->id
            ]);

            // Guardar
            if($suscripcion->save()) {
                return $this->sendOk();
            } else {
                return $this->sendErrorDatabase();
            }

        } else {
            //return $this->sendOk();
            return $this->sendMessage("El usuario ja esta suscrito");
        }
    }

    /**
     * Eliminar
     */
    public function eliminar(Request $request)
    {
        // Comprovar que existe
        $suscripcion = Auth::user()->suscripciones->find($request->id);
        if($suscripcion != null) {

            if($suscripcion->delete()) {
                return $this->sendOk();
            } else {
                return $this->sendErrorDatabase();
            }

        } else {
            return $this->sendErrorNotFound("No existe la suscripcion");
        }
    }
}
