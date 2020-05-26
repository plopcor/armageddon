<?php

use Illuminate\Database\Seeder;

class TestingSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UsuariosSeeder::class);
        $this->call(TiendasSeeder::class);
        $this->call(ProductosSeeder::class);
        $this->call(CategoriasSeeder::class);
        $this->call(ProductoCategoriaSeeder::class);
        $this->call(SuscripcionesSeeder::class);
    }
}
