<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tienda extends Model
{

    protected $fillable = [
        'nombre', 'id_propietario', 'longitud', 'latitud', 'imagen'
    ];

    /**
     * Propietario de la tienda
     */
    public function propietario()
    {
        return $this->belongsTo(User::class, 'id_propietario');
    }

    /**
     * Coordenadas en array
     */
    public function coordenadas()
    {
        return array(
            $this->longitud,
            $this->latitud
        );
    }

    /**
     * Productos de la Tienda
     */
    public function productos()
    {
        // TODO
//        return $this->belongsToMany(Producto::class, 'producto_tienda', 'id_tienda', 'id_producto');
//        return $this->belongsToMany(ProductoTienda::class, 'producto_tienda', 'id_tienda');
        return $this->hasMany(ProductoTienda::class, 'id_tienda');
    }

    /**
     * Categorias de la Tienda
     */
    public function categorias()
    {
        return $this->belongsToMany(Categoria::class, 'tienda_categoria', 'id_tienda', 'id_categoria');
    }
}
