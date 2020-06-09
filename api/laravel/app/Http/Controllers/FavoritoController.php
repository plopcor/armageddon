<?php

namespace App\Http\Controllers;

use App\Favorito;
use App\Suscripcion;
use Illuminate\Http\Request;
use Auth;
use Illuminate\Support\Facades\Validator;
use App\Tienda;
use App\Pedido;
use App\Traits;

class FavoritoController extends APIController
{
    use Traits\RecuperarConExcepciones;

    /**
     * Listar
     */
    public function listar()
    {
        $favoritos = Auth::user()->favoritos;
        return $this->sendResponse($favoritos);
    }

    /**
     * Crear
     */
    public function crear(Request $request)
    {
        // Recuperar pedido
        $pedido = Auth::user()->pedidos->find($request->id);
        if($pedido == null) {
            return $this->sendErrorNotFound("No existe el pedido especificado");
        }

        // Comprovar si ya existe el favorito
        $favorito = Auth::user()->favoritos->where('id_pedido', $pedido->id)->first();
        if($favorito == null) {

//            $nombre = "Fav. " . Auth::user()->favoritos->count() + 1;
            $nombre = !empty($request->nombre) ? $request->nombre : "Favorito";

            $favorito = Favorito::create([
                'nombre' => $nombre,
                'id_usuario' => Auth::user()->id,
                'id_pedido' => $pedido->id
            ]);

            if($favorito->save()) {
                return $this->sendOk();
            } else {
                return $this->sendErrorDatabase();
            }

        } else {
            return $this->sendErrorConflict("Ya se ha añadido a Favoritos");
        }
    }

    /**
     * Eliminar
     */
    public function eliminar(Request $request)
    {
        $favorito = Auth::user()->favoritos->find($request->id);
        if($favorito != null) {

            // Eliminar
            if($favorito->delete()) {
                return $this->sendOk();
            } else {
                return $this->sendErrorDatabase();
            }

        } else {
            return $this->sendErrorNotFound("El Favorito especificado no existe");
        }
    }
}
