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
                'name' => 'Usuario 1',
                'email' => 'usuario1@mail.com',
                'password' => bcrypt('usuario1'),
                'avatar' => 'https://www.washingtonpost.com/resizer/uwlkeOwC_3JqSUXeH8ZP81cHx3I=/arc-anglerfish-washpost-prod-washpost/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg'
            ],
            [
                'id' => 2,
                'name' => 'Usuario 2',
                'email' => 'usuario2@mail.com',
                'password' => bcrypt('usuario2')
            ],
            [
                'id' => 3,
                'name' => 'Usuario 3',
                'email' => 'usuario3@mail.com',
                'password' => bcrypt('usuario3')
            ],
            [
                'id' => 4,
                'name' => 'Usuario 4',
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
                'name' => 'Tienda 1',
                'email' => 'tienda1@mail.com',
                'password' => bcrypt('tienda1'),
                'avatar' => 'https://cdn131.picsart.com/307342630030211.png',
                'esTienda' => true
            ],
            [
                'id' => 6,
                'name' => 'Tienda 2',
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
