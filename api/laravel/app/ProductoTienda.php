<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductoTienda extends Model
{
    protected $table = 'producto_tienda';

    protected $fillable = [
        'id_tienda', 'id_producto', 'precio', 'disponible'
    ];

    protected $casts = [
        'precio' => 'float',
        'disponible' => 'boolean'
    ];



//    /**
//     * Disponible en la tienda
//     */
//      https://laracasts.com/discuss/channels/eloquent/casting-to-boolean?page=1
//    public function getDisponibleAttribute($value)
//    {
//        return (!empty($value) && $value == 1);
//    }

    /**
     * Tienda del producto
     */
    public function tienda()
    {
        return $this->hasOne(Tienda::class, 'id_tienda');
    }

    /**
     * Producto original
     */
    public function producto()
    {
        return $this->belongsTo(Producto::class, 'id_producto');
    }
}
