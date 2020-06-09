<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    //protected $redirectTo = RouteServiceProvider::HOME;
    // Redireccionar a pagina principal
    protected $redirectTo = '/';


    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

//    /**
//     * Autenticacion personalizada
//     */
//    public function login(Request $request)
//    {
//        //$credentials = $request->only('usuario', 'password');
//
//        $credentials = ['usuario' => $request->usuario, 'password' => $request->password];
//
//        $remember_me = $request->remember_me ?? false;
//
//        if (Auth::attempt($credentials, $remember_me)) {
//            return redirect()->intended('panel');
//        } else {
//            return redirect()->route('login')->with('error','Usuario o contraseña incorrectos.');
//        }
//    }

    /**
     * Get the login username to be used by the controller.
     *
     * @return string
     */
    public function username()
    {
        return 'usuario';
    }

    /**
     * Custom "Bad Credentials" response
     *
     * @param Request $request
     */
    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            'credenciales' => ['Las credenciales son incorrectas'],
        ]);
    }


}
