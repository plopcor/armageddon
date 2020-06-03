<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Illuminate\Support\Facades\Validator;

class UsuarioController extends APIController
{

    /**
     * Ver
     */
    public function ver()
    {
        return $this->sendResponse(Auth::user());
    }

    /**
     * Editar
     */
    public function editar(Request $request)
    {
        // Validar datos
        $validator = Validator::make($request->all(), [
            'nombre' => 'string',
            'email' => 'email',
            'avatar' => 'url',
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        // Actualizar datos
        $user = Auth::user();
        if(!empty($request->nombre)) {
            $user->nombre = $request->nombre;
        }
        if(!empty($request->email)) {
            $user->nombre = $request->nombre;
        }

        // Guardar
        if ($user->save()) {
            return $this->sendOk();
        } else {
            return $this->sendErrorDatabase();
        }

    }

}

