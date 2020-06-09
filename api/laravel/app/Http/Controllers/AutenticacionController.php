<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Illuminate\Support\Facades\Validator;

class AutenticacionController extends APIController
{
    /**
     * Login
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'usuario'       => 'required|string',
            'contraseña'    => 'required|string',
            'remember_me' => 'boolean',
        ]);

        if($validator->fails()){
            return $this->sendError(400, 'Datos incorrectos', $validator->errors());
        }

        if (Auth::attempt(['usuario' => request('usuario'), 'password' => request('contraseña')])) {

            $user = Auth::user();
            $success['token'] = $user->createToken('APIToken')->accessToken;
            $success['usuario'] = $user;

            if ($request->remember_me) {
                $success['token']->expires_at = Carbon::now()->addWeeks(1);
            }

            return $this->sendResponse($success);

        } else {

            return $this->sendError(401, "Error de autenticacion", ['Usuario o contraseña incorrectos']);
        }
    }

    /**
     * Registro
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string',
            'usuario' => 'required|string|unique:users',
            'contraseña' => 'required|string',
            'email' => 'string|email',
            'avatar' => 'url'
        ]);

        if($validator->fails()){
            return $this->sendError(400, 'Datos incorrectos', $validator->errors());
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['contraseña']);
        $user = User::create($input);

        $success['token'] =  $user->createToken('APIToken')->accessToken;
        $success['usuario'] =  $user;

        return $this->sendResponse($success);
    }

    /**
     * Logout
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return $this->sendMessage("Session cerrada correctamente");
    }

    /**
     * Verificar un token
     */
    public function verificar_token()
    {
        $usuario = Auth::user()->usuario;
        return $this->sendOk();
    }

    /**
     * Ver tokens propios
     */
    public function listar_tokens()
    {
        $tokens = Auth::user()->accessTokens()->get();
        return $this->sendResponse($tokens);
    }

}

