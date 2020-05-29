<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use App\User;
use App\Tienda;
use App\Traits;
use Illuminate\Support\Facades\Validator;

class TiendaPropiaController extends APIController
{
    use Traits\RecuperarConExcepciones;

    /**
     * Ver
     */
    public function ver()
    {
        $tienda = $this->recuperarTiendaPropia();
        return $this->sendResponse($tienda);
    }

    /**
     * Crear
     */
    public function crear(Request $request)
    {
        // Comprovar si ya tiene una tienda
        $tienda = Auth::user()->tienda;
        if($tienda == null) {

            // Validator datos
            $validator = Validator::make($request->all(), [
                'nombre' => 'required|string',
                'longitud' => 'numeric|between:-180,180',
                'latitud' => 'numeric|between:-90,90',
                'imagen' => 'url',
            ]);

            if($validator->fails()){
                return $this->sendErrorBadRequest($validator->errors());
            }

            $data = $request->all();
            $data['id_propietario'] = Auth::user()->id;
            $tienda = Tienda::create($data);

            // Guardar Tienda
            if($tienda->save()) {

                // Actualizar usuario
                Auth::user()->esTienda = true;
                Auth::user()->save();

                return $this->sendResponse($tienda);
            } else {
                return $this->sendErrorDatabase();
            }

        } else {
            return $this->sendError(409, "Ya tienes una tienda");
        }
    }

    /**
     * Editar
     */
    public function editar(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();

        // TODO
    }

}
