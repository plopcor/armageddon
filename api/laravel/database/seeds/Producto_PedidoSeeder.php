<?php

use Illuminate\Database\Seeder;

class ProductoPedidoSeeder extends Seeder
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
            [
                'id_pedido' => 1, 'productos' => [
                    ['id_producto' => 1, 'cantidad' => 1, 'precio_unidad' => 1.5]
                ],
            ],
            [
                'id_pedido' => 2, 'productos' => [
                    ['id_producto' => 2, 'cantidad' => 2, 'precio_unidad' => 1.6],
                    ['id_producto' => 4, 'cantidad' => 1, 'precio_unidad' => 2]
                ]
            ]
        ];

        /*
         * DATOS
         */

        $datos = array();
        foreach($input as $in) {

            $item = array();
            $item['id_pedido'] = $in['id_pedido'];

            foreach($in['productos'] as $producto) {
                $item['id_producto'] = $producto['id_producto'];
                $item['cantidad'] = $producto['cantidad'];
                $item['precio_unidad'] = $producto['precio_unidad'];

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
            DB::table('producto_pedido')->insert($item);
        }
    }
}
