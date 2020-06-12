@extends('layouts.app')

@section('content')


    <div class="table-responsive">

        <div class="col p-2">
            <h2 class="d-inline-block">Productos</h2>
            <button type="button" class="btn btn-primary float-right mx-1" onclick="mostrarAñadirProducto();">Añadir producto</button>
        </div>

        <table class="table table-striped table-hover">
            <thead> <!--  class="thead-dark" -->
            <tr>
                <th width="80px">#</th>
                <th class="text-center" width="90px">Imagen</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th class="text-center" width="100px">Disponible</th>
                <th width="100px"></th>
            </tr>
            </thead>
            <tbody id="tabla-productos-items">
            <!-- PRODUCTOS -->
            </tbody>
        </table>
    </div>

    <!-- SCRIPTS -->
    <script>

        PRODUCTOS = {};

        $( document ).ready(function() {

            // Recuperar productos
            getProductos();
        });

        // Recuperar Productos
        function getProductos() {

            enviarPeticion('/tienda/productos', 'GET', null, function(data) {
                console.log('Recuperado ' + data.data.length + " productos")
                loadProductos(data.data);
            }, function() {
                alert('Error al recuperar los productos');
            });
        }

        // Cargar productos en el listado
        function loadProductos(jsonProductos) {

            // Limpiar
            PRODUCTOS = {};
            var lista = $('#tabla-productos-items');
            lista.empty();

            // Por cada productoTienda, recojer los datos necessarios
            jQuery.each(jsonProductos, function() {

                var prod = new Object();
                prod.id = this.id;
                prod.nombre = this.producto.nombre;
                prod.precio = this.precio.toFixed(2);
                prod.disponible = this.disponible;
                prod.imagen = this.producto.img_path;

                // Añadir a la lista de productos
                PRODUCTOS[this.id] = prod;
            });

            // Por cada producto, añadirlo a la lista
            jQuery.each(PRODUCTOS, function() {

                var item = "" +
                    '<tr data-idproducto="' + this.id + '">' +
                    '<td>'+ this.id +'</td>' +
                    '<td class="text-center"><img src="' + this.imagen + '" height="35px"></td>' +
                    '<td>'+ this.nombre + '</td>' +
                    '<td>'+ this.precio +'€</td>' +
                    '<td class="text-center">' +
                    '   <div class="custom-control custom-switch">' +
                    '       <input type="checkbox" class="custom-control-input" id="customSwitch'+this.id+'" '+ (this.disponible ? 'checked':'') +'>' +
                    '       <label class="custom-control-label" for="customSwitch'+this.id+'"></label>' +
                    '   </div>' +
                    '</td>' +
                    '<td class="text-center"><i class="fa fa-pencil fa-lg" onclick="mostrarEditarProducto(\''+this.id+'\')"></i></td>' +
                    '</tr>';

                lista.append(item);
            });
        }


        //
        // FUNCIONES
        //
        function mostrarEditarProducto(idProducto) {

            var producto = PRODUCTOS[idProducto];
            if(producto == undefined) {
                alert('Error, no existe el producto');
                return;
            }

            // Pasar datos al modal
            $('#modalEditar_id').val(idProducto);
            $('#modalEditar_nombre').val(producto.nombre);
            $('#modalEditar_precio').val(producto.precio);
            $('#modalEditar_disponible').prop('checked', producto.disponible);

            $('#modalEditarProducto').modal('show');
        }

        function canviarDisponibilidad(idProducto) {

            // TODO
            enviarPeticion('/tienda/productos', 'PUT', null, function(data) {
                console.log('Recuperado ' + data.data.length + " productos")
                loadProductos(data.data);
            }, function() {
                alert('Error al recuperar los productos');
            });
        }

        // Mostrar Modal de Añadir producto
        function mostrarAñadirProducto() {
            $('#modalAñadir_disponible').prop('checked', true);
            recuperarProductosBase();
        }

        // Añadir producto
        function añadirProducto() {

            var idProducto = $('#modalAñadir_productoBase').val();
            var precio = $('#modalAñadir_precio').val();
            var disponible = $('#modalAñadir_disponible').is(':checked');

            // Checks
            if(idProducto == undefined || idProducto == "") {
                alert('Has de seleccionar un producto');
                return;
            }
            if(precio == "" || precio < 0 || precio > 99999.99) {
                alert('Has de ser un precio valido (entre 0 y 99999,99)');
                return;
            }

            // Hacer peticion
            var data = {'idProducto': idProducto, 'precio': precio, 'disponible': (disponible ? "1" : "0")}
            enviarPeticion('/tienda/producto', 'POST', data, function(data) {
                console.log('Añadido producto a la tienda');
                $('#modalAñadirProducto').modal('hide');
                getProductos();
            });

        }

        // Recuperar productos base
        function recuperarProductosBase() {

            enviarPeticion('/productos/base', 'GET', null, function(data) {
                console.log('Recuperado ' + data.data.length + " productos base")

                var select = $('#modalAñadir_productoBase');
                select.empty();
                $.each(data.data, function() {
                    select.append($("<option />").val(this.id).text(this.nombre));
                });

                $('#modalAñadirProducto').modal('show');

            }, function() {
                alert('Error al recuperar los productos base');
                return false;
            });
        }

        function editarProducto() {

            // Cojer ID del modal
            var idProducto = $('#modalEditar_id').val();
            var precio = $('#modalEditar_precio').val();
            var disponible = $('#modalEditar_disponible').is(':checked');

            idProducto = parseInt(idProducto);
            if(idProducto == undefined || idProducto == "") {
                alert('Has de seleccionar un producto');
                return;
            }

            if(precio == "" || precio < 0 || precio > 99999.99) {
                alert('Has de poner un precio valido (entre 0 y 99999,99)');
                return;
            }

            // Hacer peticion
            var data = {'precio': precio, 'disponible': (disponible ? "1" : "0")}
            enviarPeticion('/tienda/producto/'+idProducto, 'PUT', data, function(data) {
                console.log('Editado el producto ' + idProducto + ' de la tienda');
                $('#modalEditarProducto').modal('hide');
                getProductos();
            });
        }

        function eliminarProducto() {

            // Cojer ID del modal
            var idProducto = $('#modalEditar_id').val();
            idProducto = parseInt(idProducto);
            if(idProducto == undefined || idProducto == "") {
                alert('No hay ID de producto a eliminar');
                return;
            }

            enviarPeticion('/tienda/producto/'+idProducto, 'DELETE', null, function(data) {
                console.log('Eliminado el producto ' + idProducto + ' a la tienda');
                $('#modalEditarProducto').modal('hide');
                getProductos();
            });
        }

    </script>

    <!-- Modal -->
    <div class="modal fade" id="modalEditarProducto" tabindex="-1" role="dialog" aria-labelledby="EditarProductoModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Editar producto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="modalEditar_id" value="">
                    <div class="container-fluid">
                        <div class="row">
                            <label for="recipient-name" class="col-form-label">Nombre:</label>
                            <input type="text" class="form-control" id="modalEditar_nombre" readonly>
                        </div>
                        <div class="row">
                            <div class="col-md-6 p-0">
                                <label for="recipient-name" class="col-form-label">Precio:</label>
                                <input type="number" class="form-control" id="modalEditar_precio">
                            </div>
                            <div class="col">
                                <label for="recipient-name" class="col-form-label">Disponible:</label>
                                <input type="checkbox" class="form-control" id="modalEditar_disponible">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger mr-auto" onclick="eliminarProducto()">Eliminar</button>
                    <button type="button" class="btn btn-success" onclick="editarProducto()">Guardar</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal Añadir producto -->
    <div class="modal fade" id="modalAñadirProducto" tabindex="-1" role="dialog" aria-labelledby="modalAñadirProductoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Añadir un producto</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <label for="recipient-name" class="col-form-label">Producto base:</label>
                            <select class="form-control" id="modalAñadir_productoBase">
                                <option>1</option>
                            </select>
                        </div>
                        <div class="row">
                            <div class="col-md-6 p-0">
                                <label for="recipient-name" class="col-form-label">Precio:</label>
                                <input type="number" class="form-control" id="modalAñadir_precio">
                            </div>
                            <div class="col">
                                <label for="recipient-name" class="col-form-label">Disponible:</label>
                                <input type="checkbox" class="form-control" id="modalAñadir_disponible">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-success" onclick="añadirProducto();">Añadir</button>
                </div>
            </div>
        </div>
    </div>

@endsection
