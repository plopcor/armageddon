<?php
namespace App\Traits;
use App\Tienda;

trait RecuperarConExcepciones {

    /**
     * Recuperar objetos y comprovar que devuelven resultados
     * Si NO devuelven resultados, ENVIA UNA RESPUESTA DE ERROR y sale del codigo
     */

    /**
     * Tienda by ID
     */
    public function recuperarTiendaById($idTienda)
    {
        // Recuperar la tienda por ID
        $tienda = Tienda::where('id', $idTienda)->first();

        if($tienda == null) {
            $this->sendErrorNotFound("Tienda no encontrada")->send();
            exit();
        }

        return $tienda;
    }

    /**
     *
     */

}
