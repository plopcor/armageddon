<?php

use Illuminate\Database\Seeder;

class FavoritosSeeder extends Seeder
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
            ['id_usuario' => 1, 'pedidos' => [1, 2]]
        ];

        /*
         * DATOS
         */

        $datos = array();
        foreach($input as $in) {

            $item = array();
            $item['id_usuario'] = $in['id_usuario'];

            foreach($in['pedidos'] as $id_pedido) {
                $item['id_pedido'] = $id_pedido;

                $datos[] = $item;
            }
        }


        /*
         * AUTOGENERADOS
         */

        $id = 1;
        foreach($datos as $k => $item) {
            $item['id'] = $id;
            $item['nombre'] = "Fav. ".($id+1);

            $datos[$k] = $item;
            $id++;
        }

        /*
         * INSERTAR
         */

        foreach($datos as $item) {
            DB::table('favoritos')->insert($item);
        }

    }
}
