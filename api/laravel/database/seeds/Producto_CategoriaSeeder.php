<?php

use Illuminate\Database\Seeder;

class ProductoCategoriaSeeder extends Seeder
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
            ['id_producto' => 1, 'categorias' => [1, 2]],
            ['id_producto' => 2, 'categorias' => [1, 2]],
            ['id_producto' => 3, 'categorias' => [2, 3, 4]],
            ['id_producto' => 4, 'categorias' => [1, 5]],
            ['id_producto' => 5, 'categorias' => [4]],
            ['id_producto' => 6, 'categorias' => [6, 7]]
        ];

        /*
         * DATOS
         */

        $datos = array();
        foreach($input as $in) {

            $item = array();
            $item['id_producto'] = $in['id_producto'];

            foreach($in['categorias'] as $categoria) {
                $item['id_categoria'] = $categoria;

                $datos[] = $item;
            }
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
            DB::table('producto_categoria')->insert($item);
        }
    }
}
