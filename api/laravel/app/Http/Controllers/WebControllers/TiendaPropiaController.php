<?php

namespace App\Http\Controllers\WebControllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use DB;
use App\User;
use App\Tienda;
use App\Traits;
use Illuminate\Support\Facades\Validator;

class TiendaPropiaController extends Controller
{
    /**
     * Panel principal
     */
    public function panel() {
        return view('panel');
    }


    // ------------------------------------------------------------------
    // Productos
    // ------------------------------------------------------------------
    /**
     * Listar productos
     */
    public function productos()
    {
        return view('productos');
    }


    // ------------------------------------------------------------------
    // Pedidos
    // ------------------------------------------------------------------
    /**
     * Listar pedidos
     */
    public function pedidos()
    {
        return view('pedidos');
    }

    // ------------------------------------------------------------------
    // Perfil
    // ------------------------------------------------------------------
    /**
     * Ver perfil
     */
    public function perfil()
    {
        return view('perfil');
    }

}
