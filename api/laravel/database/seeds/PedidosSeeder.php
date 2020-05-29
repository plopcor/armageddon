<?php

use Illuminate\Database\Seeder;

class PedidosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /*
         * DATOS
         */

        $datos = [
            [
                'id_usuario' => 1,
                'id_tienda' => 1,
                'estado' => 'CREADO',
                'recogida' => date("Y-m-d H:i:s"),
            ],
            [
                'id_usuario' => 1,
                'id_tienda' => 1,
                'estado' => 'CREADO',
                'recogida' => date("Y-m-d H:i:s")
            ],
        ];

        /*
         * AUTOGENERADOS
         */

        $id = 1;
        foreach($datos as $k => $item) {
            $item['id'] = $id;
            $item['created_at'] = date("Y-m-d H:i:s");
            $datos[$k] = $item;
            $id++;
        }

        /*
         * INSERTAR
         */

        foreach($datos as $item) {
            DB::table('pedidos')->insert($item);
        }

    }
}
