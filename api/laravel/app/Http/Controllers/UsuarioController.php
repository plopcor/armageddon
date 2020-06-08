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

        // Cojer datos
        $data = [];
        if($request->nombre) {
            $data['nombre'] = $request->nombre;
        }
        if(!empty($request->email)) {
            $data['email'] = $request->email;
        }
        if(!empty($request->avatar)) {
            $data['avatar'] = $request->avatar;
        }

        // Actualizar datos
        $user = Auth::user();
        $user->update($data);

        // Guardar
        if ($user->save()) {
            return $this->sendOk();
        } else {
            return $this->sendErrorDatabase();
        }

    }

}

