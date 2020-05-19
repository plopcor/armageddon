<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{

    /*
     * Categorias del producto
     */
    public function categorias() {
        return $this->belongsToMany(Categoria::class, 'producto_categoria', 'id_producto', 'id_categoria');
    }

    /*
     *
     */

}
