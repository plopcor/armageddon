<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tienda extends Model
{

    protected $fillable = [
        'nombre', 'longitud', 'latitud'
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
        return $this->belongsToMany(Producto::class, 'producto_tienda', 'id_tienda', 'id_producto');
    }

    /**
     * Categorias de la Tienda
     */
    public function categorias()
    {
        return $this->belongsToMany(Categoria::class, 'tienda_categoria', 'id_tienda', 'id_categoria');
    }
}
