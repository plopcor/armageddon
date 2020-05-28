<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Tienda;
use App\ProductoTienda;

class Producto extends Model
{

    protected $fillable = [
        'nombre', 'img_path'
    ];

    /**
     * Categorias del producto
     */
    public function categorias()
    {
        return $this->belongsToMany(Categoria::class, 'producto_categoria', 'id_producto', 'id_categoria');
    }

    /**
     * Tiendas con ese producto
     */
    public function tiendas()
    {
        return $this->belongsToMany(Tienda::class, 'producto_tienda', 'id_producto', 'id_tienda');
    }

    /**
     * Productos en tiendas
     */
    public function productos()
    {
        return $this->hasMany(ProductoTienda::class, 'id_producto');
    }

}
