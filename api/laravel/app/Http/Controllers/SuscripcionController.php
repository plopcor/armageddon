<?php

namespace App\Http\Controllers;

use App\Suscripcion;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Validator;
use App\Tienda;

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
    public function crear(Request $request)
    {
        // Cojer ID de la tienda
//        $validator = Validator::make($request->all(), [
//            'id' => 'required|integer'
//        ]);
//
//        if($validator->fails()){
//            return $this->sendErrorBadRequest($validator->errors());
//        }

        // Comprovar que la tienda existe
        $tienda = Tienda::where('id', $request->id)->first();
        $idUsuario = Auth::user()->id;

        if($tienda == null) {
            return $this->sendErrorNotFound("Tienda no encontrada");
        }

        // Comprovar que no esta suscrito ya
        if(Suscripcion::where('id_usuario', $idUsuario)->where('id_tienda', $tienda->id)->first() == null) {

            // Crear nueva
            $suscripcion = Suscripcion::create([
                'id_usuario' => $idUsuario, 'id_tienda' => $tienda->id
            ]);

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
        $suscripcion = Suscripcion::where('id_usuario', Auth::user()->id)->where('id_tienda', $request->id)->first();
        if($suscripcion != null) {

            $suscripcion->delete();
            return $this->sendOk();

        } else {
            return $this->sendErrorNotFound("Tienda no encontrada");
        }
    }
}
