<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Tienda extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //se llama practicas, igual que la funcion en user
        Schema::create('tiendas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre');
            //llave foranea. De user. Recordemos que en el Modelo hemos especificado la relacion 1-n con user
            $table->integer('user_id')->index();
            $table->timestamps();
            //nota. Ojo, PHP asume que siempre es required, a no ser que le pongas nullable
            $table->integer('nota')->nullable();
            $table->string('path')->nullable();
            $table->boolean('fichero')->nullable();
          });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tiendas');
    }
}
