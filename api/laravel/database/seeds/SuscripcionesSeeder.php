<?php

use Illuminate\Database\Seeder;

class SuscripcionesSeeder extends Seeder
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
            [1, 1],
            [1, 2],
            [2, 1],
            [3, 1],
            [3, 2]
        ];

        /*
         * DATOS
         */

        $datos = array();
        foreach($input as $in) {
            $datos[] = array('id_usuario' => $in[0], 'id_tienda' => $in[1]);
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
            DB::table('suscripciones')->insert($item);
        }

    }
}
