<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Suscripcion extends Model
{
    protected $table = 'suscripciones';

    protected $fillable = [
        'id_usuario', 'id_tienda'
    ];

    protected $hidden = [
        'id_usuario', 'id_tienda'
    ];

    /**
     * Usuario de la suscripcion
     */
    public function usuario() {
        return $this->belongsTo(User::class, 'id_usuario');
    }

    /**
     * Tienda de la suscripcion
     */
    public function tienda() {
        return $this->belongsTo(Tienda::class, 'id_tienda');
    }


}
