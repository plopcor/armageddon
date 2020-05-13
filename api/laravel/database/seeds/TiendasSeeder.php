<?php

use Illuminate\Database\Seeder;

class TiendasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tiendas')->insert([
            'id' => 1,
			'nombre' => 'Cafe Esquina',
			'id_propietario' => 1
        ]);
        
		DB::table('tiendas')->insert([
            'id' => 2,
			'nombre' => 'Panaderia Baker',
			'id_propietario' => 3
        ]);
		
		DB::table('tiendas')->insert([
            'id' => 3,
			'nombre' => 'Supermercado Myko',
			'id_propietario' => 4
        ]);
    }
}
