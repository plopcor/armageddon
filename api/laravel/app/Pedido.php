<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    protected $fillable = [
        'id_usuario', 'id_tienda', 'estado', 'recogida'
    ];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $casts = [
        'recogida' => 'datetime'
    ];


    /**
     * Usuario del pedido
     */
    public function usuario() {
        return $this->belongsTo(User::class, 'id_usuario');
    }

    /**
     * Tienda del pedido
     */
    public function tienda() {
        return $this->belongsTo(Tienda::class, 'id_tienda');
    }

    /**
     * Productos del pedido
     */
    public function productos() {
        // TODO
        // Ha de recuperar los productos de la tienda poniendo la cantidad y precio de la tabla producto_pedido
        //$this->hasOne();
    }

    /**
     * Pago del pedido
     */
    // TODO
}
