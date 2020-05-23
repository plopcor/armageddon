<?php

use Illuminate\Database\Seeder;

class UsuariosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /*
         * USUARIOS NORMALES
         */
        $datos_usuarios = [
            [
                'id' => 1,
                'nombre' => 'Usuario 1',
                'usuario' => 'usuario1',
                'email' => 'usuario1@mail.com',
                'password' => bcrypt('usuario1'),
                'avatar' => 'https://www.washingtonpost.com/resizer/uwlkeOwC_3JqSUXeH8ZP81cHx3I=/arc-anglerfish-washpost-prod-washpost/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg'
            ],
            [
                'id' => 2,
                'nombre' => 'Usuario 2',
                'usuario' => 'usuario2',
                'email' => 'usuario2@mail.com',
                'password' => bcrypt('usuario2')
            ],
            [
                'id' => 3,
                'nombre' => 'Usuario 3',
                'usuario' => 'usuario3',
                'email' => 'usuario3@mail.com',
                'password' => bcrypt('usuario3')
            ],
            [
                'id' => 4,
                'nombre' => 'Usuario 4',
                'usuario' => 'usuario4',
                'email' => 'usuario4@mail.com',
                'password' => bcrypt('usuario4')
            ]
        ];

        // TIMESTAMPS
        foreach($datos_usuarios as $k => $item) {
            $item['created_at'] = date("Y-m-d H:i:s");
            $datos[$k] = $item;
        }

        /*
         * USUARIOS - INSERTAR
         */

        foreach($datos_usuarios as $item) {
            DB::table('users')->insert($item);
        }


        /*
         * TIENDAS - DATOS
         */

        $datos_tiendas = [
            [
                'id' => 5,
                'nombre' => 'Tienda 1',
                'usuario' => 'tienda1',
                'email' => 'tienda1@mail.com',
                'password' => bcrypt('tienda1'),
                'avatar' => 'https://cdn131.picsart.com/307342630030211.png',
                'esTienda' => true
            ],
            [
                'id' => 6,
                'nombre' => 'Tienda 2',
                'usuario' => 'tienda1',
                'email' => 'tienda2@mail.com',
                'password' => bcrypt('tienda2'),
                'avatar' => 'https://i.redd.it/9feswlg1n8z41.jpg',
                'esTienda' => true
            ]
        ];

        // TIMESTAMPS
        foreach($datos_usuarios as $k => $item) {
            $item['created_at'] = date("Y-m-d H:i:s");
            $datos[$k] = $item;
        }

        /*
         * TIENDAS - INSERTAR
         */

        foreach($datos_tiendas as $item) {
            DB::table('users')->insert($item);
        }
    }
}
