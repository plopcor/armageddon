<?php

use Illuminate\Database\Seeder;

class ProductoTiendaSeeder extends Seeder
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
            ['id_tienda' => 1, 'productos' => [1,2,3,4]],
            ['id_tienda' => 2, 'productos' => [2,3,4,5]]
        ];

        /*
         * DATOS
         */

        $datos = array();
        foreach($input as $in) {

            $item = array();
            $item['id_tienda'] = $in['id_tienda'];

            foreach($in['productos'] as $producto) {
                $item['id_producto'] = $producto;
                $item['precio'] = rand (1*10, 5*10) / 10; // Entre 1€ y 5€
                $datos[] = $item;
            }
        }

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
            DB::table('producto_tienda')->insert($item);
        }
    }
}
