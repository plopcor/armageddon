<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Categoria extends Model
{

    /*
     * Categorias del producto
     */
    public function productos() {
        return $this->belongsToMany(Producto::class, 'producto_categoria', 'id_categoria', 'id_producto');
    }

}
