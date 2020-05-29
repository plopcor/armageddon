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

    protected $with = [
        'productos'
    ];

    // Añadir al objeto las propiedades "cantidad" y "precio_unidad"
//    protected $appends = [
//        'cantidad', 'precio_unidad'
//    ];

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
        return $this->belongsToMany(ProductoTienda::class, 'producto_pedido', 'id_pedido', 'id_producto')->withPivot('cantidad', 'precio_unidad');
        // Ha de recuperar los productos de la tienda poniendo la cantidad y precio de la tabla producto_pedido
    }

    public function getCantidadAttribute($value)
    {
        return $this->pivot->cantidad;
    }

    public function getPrecioUnidadAttribute($value)
    {
        return $this->pivot->precio_unidad;
    }

    /**
     * Pago del pedido
     */
    // TODO
}
