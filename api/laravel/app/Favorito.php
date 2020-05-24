<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Favorito extends Model
{
    protected $fillable = [
        'nombre', 'id_usuario', 'id_tienda', 'id_productosFavoritos'
    ];

    /**
     * Productos del Favorito
     */
    public function productos()
    {
        // TODO => Cantidad
        return $this->belongsToMany(ProductoTienda::class, 'producto_favorito', 'id_favorito', 'id_productoTienda');
    }

    /**
     * Tienda del Favorito
     */
    public function tienda()
    {
        return $this->belongsTo(Tienda::class, 'id_tienda');
    }

}
