<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nombre', 'usuario', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token', 'email_verified_at'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     *  Cambiar campo de identificacion para autenticacion (por defecto utiliza el campo 'email')
     */
    public function findForPassport($username)
    {
        return $this->where('id', $username)->first();
    }

//    /**
//     * Cambiar campo donde se buscara la contraseña (por defecto es 'password')
//     */
//    public function validateForPassportPasswordGrant($password)
//    {
//        return Hash::check($password, $this->PasswMd);
//    }

    /**
     * Retornar la Tienda si tiene
     */
    public function tienda()
    {
        if($this->esTienda) {
            return $this->hasOne('App\Tienda', 'id_propietario');
        } else {
            return false;
        }
    }

    /**
     * Suscripciones a Tiendas
     */
    public function suscripciones()
    {
        return $this->hasMany(Suscripcion::class, 'id_usuario');
        //return $this->belongsToMany(Tienda::class, 'suscripciones', 'id_usuario', 'id_tienda');
    }

}
