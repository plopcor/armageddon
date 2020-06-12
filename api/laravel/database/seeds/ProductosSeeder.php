<?php

use Illuminate\Database\Seeder;

class ProductosSeeder extends Seeder
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
            ['nombre' => 'Cafe solo', 'img_path' => 'https://www.cafescandelas.com/uploads/thumbnail/original_edf903915880b7067633dab3e25e4065313a5b5d.png'],
            ['nombre' => 'Cafe con leche', 'img_path' => 'https://www.delonghi.com/Global/countries/es/Cafe/Recetas%20cafe/flat-white.png'],
            ['nombre' => 'Croissant', 'img_path' => 'https://medias.bridordefrance.com/media/sys_master/images/h23/hc2/8826513063966.png'],
            ['nombre' => 'Coca Cola', 'img_path' => 'https://www.cocacola.es/content/dam/GO/CokeZone/Spain/minican/coke_1x1-min.png'],
            ['nombre' => 'Baguette', 'img_path' => 'https://www.preel.es/wp-content/uploads/2017/02/baguette_250g_174.png'],
            ['nombre' => 'Patatas fritas', 'img_path' => 'https://sc02.alicdn.com/kf/UT8a3UuXktaXXcUQpbXs.png_350x350.png'],
            ['nombre' => 'Chapatta', 'img_path' => 'http://www.fripan.com/_images/product/146/4492_productg.jpg'],
            ['nombre' => 'Zumo de piña', 'img_path' => 'https://dhb3yazwboecu.cloudfront.net/818/products/medium/zumo-pina-delizum.png'],
            ['nombre' => 'Zumo de melocoton', 'img_path' => 'https://www.calfruitos.com/es/fotos/pr_1987_20170912153554.png'],
            ['nombre' => 'Fanta', 'img_path' => 'https://dragonimperial.es/wp-content/uploads/2018/08/Fanta-naranja.png'],
            ['nombre' => 'Muffin', 'img_path' => 'https://lesoleil.com.ar/wp-content/uploads/2020/04/muffins_chips-choco-2.png'],
            ['nombre' => 'Coca de San Juan', 'img_path' => 'https://www.bolleriasebastia.com/wp-content/uploads/2018/12/4BolleriaCocaCrema.png'],
            ['nombre' => 'Gofre', 'img_path' => 'https://www.iconspng.com/uploads/small-belgian-lie-ge-waffle.png'],
            ['nombre' => 'Crepe de chocolate', 'img_path' => 'https://www.enjoyzaragoza.es/wp-content/uploads/2018/12/crepe-chocolate.png']

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
            DB::table('productos')->insert($item);
        }

    }
}
