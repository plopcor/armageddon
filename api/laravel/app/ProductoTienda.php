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
        return $this->belongsTo(Tienda::class, 'id_tienda');
    }

    /**
     * Producto original
     */
    public function producto()
    {
        return $this->belongsTo(Producto::class, 'id_producto');
    }

    /**
     * Filtrar por localizacion de la tienda
     */
    public function cercaDe($geo, $radio)
    {
        return $this->tienda()->cercaDe($geo, $radio);
    }

    /**
     * Funcion para filtrar por latitud y longitud (en cuadro, no radio)
     *
     * @param $geo => Objeto con propiedades "latitud" y "longitud"
     * @param int $radio => Radio del filtro
     */
    public function filtrarGeolocalizacion($query, $geo, $radio = 2)
    {
//        $sql = "SELECT * FROM candidates WHERE
//        latitude BETWEEN ({$latitude} - ({$miles}*0.018)) AND ({$latitude} + ({$miles}*0.018)) AND
//        longitude BETWEEN ({$longitude} - ({$miles}*0.018)) AND ({$longitude} + ({$miles}*0.018));";
//        return $query
//            ->whereRaw("latitud BETWEEN ({$geo->latitud} - ({$radio}*0.018)) AND ({$geo->latitude} + ({$radio}*0.018)) AND longitud BETWEEN ({$geo->longitud} - ({$radio}*0.018)) AND ({$geo->longitud} + ({$radio}*0.018))");

        // Latitud
        $minLatitud = $geo->latitud - ($radio*0.018);
        $maxLatitud = $geo->latitud + ($radio*0.018);
        // Longitud
        $minLongitud = $geo->longitud - ($radio*0.018);
        $maxLongitud = $geo->longitud - ($radio*0.018);

        return $query
            ->whereBetween('latitud', [$minLatitud, $maxLatitud])
            ->whereBetween('longitud', [$minLongitud, $maxLongitud]);

//        return $query->whereBetween('latitud', [{$geo->latitud} - ({$radio}*0.018), $ageTo]);

//        return $query
//            ->select(['comma','separated','list','of','your','columns'])
//            ->selectRaw("{$haversine} AS distance")
//            ->whereRaw("{$haversine} < ?", [$radius]);
    }

//    /**
//     * Función para filtrar productos en un radio
//     *
//     * @param $query
//     * @param $location => Objeto con propiedades "latitud" y "longitud"
//     * @param int $radius => Radio del filtro
//     * @return mixed
//     */
//    public function scopeCloseTo($query, $location, $radius = 25)
//    {
//
//        /**
//         * In order for this to work correctly, you need a $location object
//         * with a ->latitude and ->longitude.
//         */
//        $haversine = "(6371 * acos(cos(radians($location->latitude)) * cos(radians(latitude)) * cos(radians(longitude) - radians($location->longitude)) + sin(radians($location->latitude)) * sin(radians(latitude))))";
//        return $query
//            ->select(['comma','separated','list','of','your','columns'])
//            ->selectRaw("{$haversine} AS distance")
//            ->whereRaw("{$haversine} < ?", [$radius]);
//    }

}
