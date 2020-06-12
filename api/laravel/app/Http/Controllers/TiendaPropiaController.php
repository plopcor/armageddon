<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DB;
use App\User;
use App\Tienda;
use App\Producto;
use App\ProductoTienda;
use App\Traits;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class TiendaPropiaController extends APIController
{
    use Traits\RecuperarConExcepciones;

    /**
     * Ver
     */
    public function ver()
    {
        $tienda = $this->recuperarTiendaPropia();
        return $this->sendResponse($tienda);
    }

    /**
     * Crear
     */
    public function crear(Request $request)
    {
        // Comprovar si ya tiene una tienda
        $tienda = Auth::user()->tienda;
        if($tienda == null) {

            // Validator datos
            $validator = Validator::make($request->all(), [
                'nombre' => 'required|string',
                'longitud' => 'numeric|between:-180,180',
                'latitud' => 'numeric|between:-90,90',
                'imagen' => 'url',
            ]);

            if($validator->fails()){
                return $this->sendErrorBadRequest($validator->errors());
            }

            $data = $request->all();
            $data['id_propietario'] = Auth::user()->id;
            $tienda = Tienda::create($data);

            // Guardar Tienda
            if($tienda->save()) {

                // Actualizar usuario
                Auth::user()->esTienda = true;
                Auth::user()->save();

                return $this->sendResponse($tienda);
            } else {
                return $this->sendErrorDatabase();
            }

        } else {
            return $this->sendError(409, "Ya tienes una tienda");
        }
    }

    /**
     * Editar
     */
    public function editar(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();

        // Validar datos
        $validator = Validator::make($request->all(), [
            'nombre' => 'string',
            'longitud' => 'numeric|between:-180,180',
            'latitud' => 'numeric|between:-90,90',
            'imagen' => 'url',
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        // Comprovar datos a actualizar
        if(!empty($request->nombre)) {
            $tienda->nombre = $request->nombre;
        }
        if(!empty($request->longitud)) {
            $tienda->longitud = $request->longitud;
        }
        if(!empty($request->latitud)) {
            $tienda->latitud = $request->latitud;
        }
        if(!empty($request->imagen)) {
            $tienda->imagen = $request->imagen;
        }

        // Actualizar tienda
        if($tienda->save()){
            return $this->sendOk();
        } else {
            return $this->sendErrorDatabase();
        }
    }

    /**
     * Eliminar
     */
    public function eliminar(Request $request)
    {
        // ¿¿ TODO ??
    }


    // ------------------------------------------------------------------
    // Productos
    // ------------------------------------------------------------------
    /**
     * Listar productos
     */
    public function productos_listar(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();
        $productos = $tienda->productos->load('producto');
        return $this->sendResponse($productos);
    }

//    /**
//     * Listar productos base Especificos
//     */
//    public function listar_especificos(Request $request)
//    {
//        $tienda = $this->recuperarTiendaPropia();
//        $productos = Producto::where('id_tienda', $tienda->id);
//        return $this->sendResponse($productos);
//    }

    /**
     * Ver producto
     */
    public function productos_ver(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();
        $producto = $tienda->productos->where('id', $request->idProducto)->first();
        if($producto == null) {
            return $this->sendErrorNotFound("No se ha encontrado el producto en la tienda");
        }

        // Cargar ProductoBase
        $producto->producto;

        return $this->sendResponse($producto);
    }

    /**
     * Crear producto
     */
    public function productos_añadir(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();

        // Comprovar si se esta intentando añadir un producto base (se le pasa ID del ProductoBase)
        // O se intenta crear un producto especifico para esta tienda
        if(isset($request->idProducto)) {

            // Validar datos
            $validator = Validator::make($request->all(), [
                'idProducto' => 'required|numeric',
                'precio' => 'required|numeric|between:0,99999.99',
                'disponible' => 'boolean'
            ]);

            if($validator->fails()){
                return $this->sendErrorBadRequest($validator->errors());
            }

            // Comprovar si ya esta añadido
            $producto = $tienda->productos->where('id_producto', $request->idProducto)->first();
            if($producto != null) {
                return $this->sendErrorConflict("El producto ya esta en la Tienda");
            }

            // Comprovar si existe un ProductoBase con esa ID
            $productoBase = Producto::where('id', $request->idProducto)->first();
            if($productoBase == null) {
                return $this->sendErrorNotFound();
            }

            // Cojer datos
            $input = [];
            $input['id_tienda'] = $tienda->id;
            $input['id_producto'] = $productoBase->id;
            $input['precio'] = $request->precio;
            $input['disponible'] = $request->disponible ?? true;

            // Añadir producto a nuestra Tienda
            $producto = ProductoTienda::create($input);

            return $this->sendResponse($producto);

        } else {

            // Crear nuevo producto especifico

            // Validar datos
            $validator = Validator::make($request->all(), [
                'nombre' => 'required|numeric',
                'imagen' => 'url',
                'precio' => 'required|numeric|between:0,99999.99',
                'disponible' => 'boolean'
            ]);

            if($validator->fails()){
                return $this->sendErrorBadRequest($validator->errors());
            }

            // Mirar si hay un producto especifico con el mismo nombre
            $producto = $tienda->productosEspecificos->whereRaw( 'LOWER(`nombre`) like ?', array( strtolower($request->nombre) ) );
            if($producto != null) {
                return $this->sendErrorConflict();
            }

            // Cojer datos para el Producto especifico Base
            $inputProductoBase = [];
            $inputProductoBase['nombre'] = $request->nombre;
            $inputProductoBase['img_path'] = $request->imagen;
            $inputProductoBase['esEspecifico'] = true;

            // Crear Producto base
            $productoBase = Producto::create($inputProductoBase);

            /*
             * AÑADIR PRODUCTO DIRECTAMENTE A LA TIENDA ??
             */

            // Cojer datos para ProductoTienda
            $inputProductoTienda = [];
            $inputProductoTienda['id_tienda'] = $tienda->id;
            $inputProductoTienda['id_producto'] = $productoBase->id;
            $inputProductoTienda['precio'] = $request->precio;
            $inputProductoTienda['disponible'] = $request->disponible ?? true;

            // Crear ProductoTienda
            $productoTienda = ProductoTienda::create($inputProductoTienda);

            // TODO ??

        }

        $validator = Validator::make($request->all(), [
            'nombre' => 'string',
            'email' => 'email',
            'avatar' => 'url',
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        $producto = $tienda->productos->where('id_producto', $request->idProducto);
    }

    /**
     * Editar producto
     */
    public function productos_editar(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();
        $producto = $tienda->productos->where('id', $request->idProducto)->first();
        if($producto == null) {
            return $this->sendErrorNotFound("No se ha encontrado el producto en la tienda");
        }

        // Validar datos
        $validator = Validator::make($request->all(), [
            'precio' => 'numeric|between:0,99999.99',
            'disponible' => 'boolean'
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        // Cojer datos
        $data = $request->only('precio', 'disponible');

        // Actualizar datos
        $producto->update($data);

        // Cargar ProductoBase
        if($producto->save()) {
            return $this->sendOk();
        } else {
            return $this->sendErrorDatabase();
        }
    }

    /**
     * Eliminar producto
     */
    public function productos_eliminar(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();
        $producto = $tienda->productos->where('id', $request->idProducto)->first();
        if($producto == null) {
            return $this->sendErrorNotFound("No se ha encontrado el producto en la tienda");
        }

        // Cargar ProductoBase
        if($producto->delete()) {
            return $this->sendOk();
        } else {
            return $this->sendErrorDatabase();
        }
    }


    // ------------------------------------------------------------------
    // Pedidos
    // ------------------------------------------------------------------
    /**
     * Listar pedidos
     *
     * nota: se puede filtrar si pasamos "estado" con un estado valido (CREADO, PAGADO, RECOGIDO)
     */
    public function pedidos_listar(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();

        // Validar datos
        $validator = Validator::make($request->all(), [
            'estado' => ['string',Rule::in(['CREADO', 'PAGADO', 'RECOGIDO'])],
        ]);

        if($validator->fails()){
            return $this->sendErrorBadRequest($validator->errors());
        }

        $pedidos = $tienda->pedidos;

        if(!empty($request->estado)) {
            $pedidos->where('estado', $request->estado);
        }

        $pedidos->load('productos');

        return $this->sendResponse($pedidos);
    }

    /**
     * Ver pedido
     */
    public function pedidos_ver(Request $request)
    {
        $tienda = $this->recuperarTiendaPropia();
        $pedido = $tienda->pedidos->where('id', $request->idPedido)->first();
        if($pedido == null) {
            return $this->sendErrorNotFound("No se ha encontrado el pedido");
        }

        // Cargar ProductoBase
        $pedido->productos;

        return $this->sendResponse($pedido);
    }

}
