<?php

namespace App\Http\Controllers;

use App\ProductoTienda;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Producto;

class ProductoController extends APIController
{
    /**
     * Listar
     */
    public function listar()
    {
        $productos = ProductoTienda::all()->load('producto');
        return $this->sendResponse($productos);
    }

    /**
     * Listar Base
     */
    public function listar_base()
    {
        $productos = Producto::all();
        return $this->sendResponse($productos);
    }

    /**
     * Buscar con filtros
     */
    public function filtrar(Request $request)
    {
        // Comprovar si se esta filtrando
        $validator = Validator::make($request->all(), [
            'longitud' => 'required_with:latitud|numeric|between:-180,180',
            'latitud' => 'required_with:longitud|numeric|between:-90,90',
            'nombre' => 'string',
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        // Aplicar filtros
//        $productos = ProductoTienda::query()
//            ->when($request->nombre, function($query) {
//                return $query->where('nombre', 'like', '%'.request('nombre').'%');
//            })
//            ->when($request->longitud && $request->latitud, function($query, $loc) {
//                return $query->where('nombre', 'like', '%'.$nombre.'%');
//            });

        // Mirar filtros
        $productos = ProductoTienda::query();
        if(!empty($request->nombre)) {
            //$productos->where('nombre', 'like', '%'.$request->nombre.'%');
            $productos = ProductoTienda::whereHas('producto', function (Builder $query) {
                    $query->where('nombre', 'like', '%'. request('nombre') .'%');
                });
        }
        if(isset($request->longitud) && isset($request->latitud)) {
            $productos->filtrarGeolocalizacion();
        }

//        $productos = ProductoTienda::
//
//        //
//        ProductoTienda::whereHas('tienda', function($query) {
//            $query->where()
//        })->all();
//
////        EquipmentAttachment::whereHas('equipment', function($query) {
////            $query->where('type', 3);
////        })->all();
//
//        //
//        $productos = ProductoTienda::all()->load('producto');

        return $this->sendResponse($productos->get());
    }

    /**
     * Ver
     */
    public function ver(Request $Request)
    {
        $producto = ProductoTienda::findOrFail($Request->id)->load('producto');
        return $this->sendResponse($producto);
    }

    /**
     * TEST FITLRAR
     */
    public function testFiltrar(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'longitud' => 'required|numeric|between:-180,180',
            'latitud' => 'required|numeric|between:-90,90',
            'radio' => 'required|numeric',
        ]);

        if($validator->fails()) {
            return $this->sendErrorBadRequest($validator->errors());
        }

        $productos = ProductoTienda::with(['tienda' => function ($q) use ($request) {
            $q->cercaDe($request, $request->radio);
        }])->get();

        //$productos = ProductoTienda::all()->cercaDe($request, 20);

        return $this->sendResponse($productos);
    }

}
