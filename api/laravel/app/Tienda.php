<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tienda extends Model
{
    public function propietario()
    {
    	return $this->belongsTo(User::class);
    }
}
