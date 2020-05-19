<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ProductoTienda extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('producto_tienda', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('id_tienda');
            $table->integer('id_producto');
            $table->decimal('precio', 7, 2); //Hasta 99.999,99
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('producto_tienda');
    }
}
