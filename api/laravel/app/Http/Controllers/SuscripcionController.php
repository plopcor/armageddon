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
        if(optional(Auth::user()->suscripciones()->where('id_tienda', $tienda->id)->first()) == null) {

            // Crear suscripcion
            $suscripcion = Suscripcion::create([
                'id_usuario' => $idUsuario, 'id_tienda' => $tienda->id
            ]);

            // Guardar
            $guardado = $suscripcion->save();
            if(!$guardado) {
                return $this->sendError(500, 'Error al crear o guardar la suscripcion');
            }

            return $this->sendOk();

        } else {
            return $this->sendMessage("El usuario ja esta suscrito");
        }
    }

    /**
     * Eliminar
     */
    public function eliminar(Request $request)
    {
        // Comprovar que existe
        //$suscripcion = Suscripcion::where('id_usuario', Auth::user()->id)->where('id_tienda', $request->id)->first();
        $suscripcion = optional(Auth::user()->suscripciones->where('id_tienda', $request->id)->first());
        if($suscripcion != null) {

            $suscripcion->delete();
            return $this->sendOk();

        } else {
            return $this->sendErrorNotFound("No existe esa suscripcion");
        }
    }

//    public function test()
//    {
//        //$suscripcion = Suscripcion::where('id_usuario', Auth::user()->id)->where('id_tienda', 3)->first();
//        $suscripcion = optional(Auth::user()->suscripciones->where('id_tienda', 3)->first())->id_usuario;
//        return $this->sendResponse($suscripcion);
//    }
}
