<?php
namespace App;

use Illuminate\Database\Eloquent\Model;

class Favorito extends Model
{
    protected $fillable = [
        'nombre', 'id_usuario', 'id_pedido'
    ];

    /**
     * Usuarios
     */

    /**
     * Pedido
     */
    public function pedido()
    {
        return $this->belongsTo(Pedido::class, 'id_pedido');
    }

    /**
     * Tienda
     */
    public function tienda()
    {
        //return $this->hasOne(Tienda::class, 'id_tienda', )
        // TODO => Test
        return $this->belongsTo(Pedido::class, 'id_pedido')->tienda;
    }
}
