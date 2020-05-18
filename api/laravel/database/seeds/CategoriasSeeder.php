<?php

use Illuminate\Database\Seeder;

class CategoriasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /*
         * INPUT
         */

        $input = [
            'Bebidas', 'Desayuno', 'Bolleria', 'Panaderia', 'Refresco', 'Snack', 'Aperitivo'
        ];

        /*
         * DATOS
         */

        $datos = array();
        foreach($input as $in) {
            $datos[] = array('nombre' => $in);
        }


        /*
         * AUTOGENERADOS
         */

        $id = 1;
        foreach($datos as $k => $item) {
            $item['id'] = $id;

            $datos[$k] = $item;
            $id++;
        }

        /*
         * INSERTAR
         */

        foreach($datos as $item) {
            DB::table('categorias')->insert($item);
        }

    }
}
