<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tienda extends Model
{

    /*
     * Propietario de la tienda
     */
    public function propietario()
    {
        return $this->belongsTo(User::class, 'id_propietario');
    }

    /*
     * Coordenadas en array
     */
    public function coordenadas() {
        return array(
            $this->longitud,
            $this->latitud
        );
    }
}
