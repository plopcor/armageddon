@extends('layouts.app')

@section('content')


    <div class="table-responsive">

        <div class="col p-2">
            <h2 class="d-inline-block">Pedidos</h2>
        </div>

        <table class="table table-striped table-hover">
            <thead> <!--  class="thead-dark" -->
            <tr>
                <th width="80px">#</th>
                <th class="text-center">Cliente</th>
                <th class="text-center">Num. de productos</th>
                <th width="15%" class="text-center">Estado</th>
                <th class="text-center">Hora de recojida</th>
                <th class="text-center" width="100px">Total</th>
                <th width="100px"></th>
            </tr>
            </thead>
            <tbody id="tabla-pedidos-items">
                <!-- PEDIDOS AQUI -->
            </tbody>
        </table>
    </div>

    <!-- SCRIPTS -->
    <script>

        PEDIDOS = {};

        $( document ).ready(function() {

            // Recuperar pedidos
            getPedidos();
        });

        // Recuperar Productos
        function getPedidos() {

            enviarPeticion('/tienda/pedidos', 'GET', null, function(data) {
                console.log('Recuperado ' + data.data.length + " pedidos")
                loadPedidos(data.data);
            }, function() {
                alert('Error al recuperar los productos');
            });
        }

        // Cargar pedidos en el listado
        function loadPedidos(jsonPedidos) {

            // Limpiar
            PEDIDOS = {};
            var lista = $('#tabla-pedidos-items');
            lista.empty();

            // Por cada pedido, recojer los datos necessarios
            jQuery.each(jsonPedidos, function() {

                var pedido = new Object();
                pedido.id = this.id;
                pedido.id_usuario = this.id_usuario;
                pedido.estado = this.estado;
                pedido.recogida = this.recogida;

                // Recojer productos del pedido
                var precioTotal = 0;
                pedido.productos = {}
                jQuery.each(this.productos, function() {

                    var prod = new Object();
                    prod.id = this.id;
                    prod.cantidad = this.pivot.cantidad;
                    prod.precio_unidad = this.pivot.precio_unidad;
                    prod.idProducto = this.producto.id;
                    prod.nombre = this.producto.nombre;
                    prod.imagen = this.producto.img_path;

                    precioTotal += (prod.precio_unidad * prod.cantidad);

                    pedido.productos[prod.id] = prod;
                });

                // Guardar precio total del pedido
                pedido.precio_total = precioTotal.toFixed(2);

                // Añadir a la lista de pedidos
                PEDIDOS[this.id] = pedido;
            });

            // Por cada pedido, añadirlo a la lista
            jQuery.each(PEDIDOS, function() {

                var colorEstado = "";
                switch(this.estado) {
                    case 'CREADO':
                        colorEstado = 'primary';
                        break;
                    case 'PAGADO':
                        colorEstado = 'success';
                        break;
                    case 'RECOGIDO':
                        colorEstado = 'dark';
                        break;
                    default:
                        colorEstado = 'white';
                }

                var item = "" +
                    '<tr data-idpedido="' + this.id + '">' +
                    '<td>'+ this.id +'</td>' +
                    '<td class="text-center">'+ this.id_usuario +'</td>' +
                    '<td class="text-center">'+ Object.keys(this.productos).length +'</td>' +
                    '<td class="text-center m-0 p-auto"> <span class="p-2 bg-'+colorEstado+' text-white rounded">'+ this.estado +'</span></td>' +
                    '<td class="text-center">'+ this.recogida +'</td>' +
                    '<td class="text-right">'+ this.precio_total +'€</td>' +
                    '<td class="text-center"><i class="fa fa-pencil fa-lg" onclick="mostrarEditarProducto(\''+this.id+'\')"></i></td>' +
                    '<td class="text-center"><i class="fa fa-pencil fa-lg" onclick="mostrarEditarProducto(\''+this.id+'\')"></i></td>' +
                    '</tr>';

                lista.append(item);
            });
        }
    </script>

@endsection
