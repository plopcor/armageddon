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
        return $this->hasMany(ProductoTienda::class, 'id_tienda');
    }

    /**
     * Productos base Especificos de la Tienda
     */
    public function productosEspecificos()
    {
        return $this->hasMany(Producto::class, 'id_tienda');
    }

    /**
     * Categorias de la Tienda
     */
    public function categorias()
    {
        return $this->belongsToMany(Categoria::class, 'tienda_categoria', 'id_tienda', 'id_categoria');
    }


    /**
     * Filtrar por geolocalizacion (latitud y longitud)
     */
    public function scopecercaDe($query, $geo, $radio)
    {
        // Latitud
        $minLatitud = $geo->latitud - ($radio*0.018);
        $maxLatitud = $geo->latitud + ($radio*0.018);

        // Longitud
        $minLongitud = $geo->longitud - ($radio*0.018);
        $maxLongitud = $geo->longitud + ($radio*0.018);

        return $query
            ->whereBetween('latitud', [$minLatitud, $maxLatitud])
            ->whereBetween('longitud', [$minLongitud, $maxLongitud]);
    }
}
