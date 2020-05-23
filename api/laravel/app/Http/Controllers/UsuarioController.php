<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\User;
use Illuminate\Support\Facades\Validator;

class UsuarioController extends APIController
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

//            return response()->json([
//                'success' => true,
//                'token' => $success,
//                'user' => $user
//            ]);

        } else {

            return $this->sendError(401, "Error de autenticacion", ['Usuario o contraseña incorrectos']);

//            //if authentication is unsuccessfull, notice how I return json parameters
////            return response()->json([
////                'success' => false,
////                'message' => 'Invalid Email or Password',
////            ], 401);
        }
    }

    /**
     * Registro
     */
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string',
            'usuario' => 'required|string',
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

    }
}
