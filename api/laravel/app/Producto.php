<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{

    protected $fillable = [
        'nombre', 'img_path', 'esEspecifico'
    ];

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
