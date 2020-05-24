<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{

    /**
     * Productos con la categoria
     */
    public function productos()
    {
        return $this->belongsToMany(Producto::class, 'producto_categoria', 'id_categoria', 'id_producto');
    }

    /**
     * Tiendas con la categoria
     */
    public function tiendas()
    {
        return $this->belongsToMany(Tienda::class, 'tienda_categoria', 'id_categoria', 'id_tienda');
    }

}
