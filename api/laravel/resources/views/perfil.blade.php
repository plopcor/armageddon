@extends('layouts.app')

@section('content')

    <div class="table-responsive">

        <div class="col p-1">
            <h2 class="d-inline-block">Perfil</h2>
        </div>
        <hr>
        <div class="row p-0 m-0">

            <div class="col-sm-12 col-md-3 mb-4 mb-sm-1">
                <div class="text-center">
                    <img src="//placehold.it/100" id="imagen-tienda" class="h-auto w-100 rounded img-circle p-2" alt="avatar">
                    <h6 class="p-1">Cambiar foto de la tienda...</h6>
                    <input type="file" name="imagen-tienda" class="form-control">
                </div>
            </div>

            <div class="col personal-info">


                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Nombre:</label>
                        <div class="col-lg-8">
                            <input id="nombre-tienda" class="form-control" type="text" value="">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-6 col-lg-4 d-inline-block">
                            <label class="col p-0 control-label">Latitud:</label>
                            <input id="latitud-tienda" class="form-control" type="number" value="0">
                        </div>
                        <div class="col-5 col-lg-4 d-inline-block">
                            <label class="col p-0 control-label">Longitud:</label>
                            <input id="longitud-tienda" class="form-control" type="number" value="0">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <input type="button" class="btn btn-primary" onclick="actualizarPerfilTienda();" value="Guardar">
                            <span></span>
                            <a href="/" class="btn btn-default">Cancelar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- SCRIPTS -->
    <script>

        PERFIL = new Object();

        $( document ).ready(function() {

            // Recuperar perfil
            getPerfilTienda();

        });

        // Recuperar perfil tienda
        function getPerfilTienda() {

            enviarPeticion('/tienda', 'GET', null, function(data) {

                loadPerfilTienda(data.data);

            }, function() {
                alert('Error al recuperar el perfil');
            });
        }

        // Cargar pedidos en el listado
        function loadPerfilTienda(jsonPerfil) {

            PERFIL = jsonPerfil;

            $('#imagen-tienda').attr("src",jsonPerfil.imagen);
            $('#nombre-tienda').val(jsonPerfil.nombre);
            $('#latitud-tienda').val(jsonPerfil.latitud);
            $('#longitud-tienda').val(jsonPerfil.longitud);
        }

        // Actualizar perfil
        function actualizarPerfilTienda() {

            var nombre = $('#nombre-tienda').val();
            var latitud = $('#latitud-tienda').val();
            var longitud = $('#longitud-tienda').val();

            nombre = (nombre == "" ? PERFIL.nombre : nombre);
            latitud = (latitud == "" ? PERFIL.longitud : latitud);
            longitud = (longitud == "" ? PERFIL.longitud : longitud);

            // Enviar datos
            var data = {'nombre': nombre, 'latitud': latitud, 'longitud': longitud}
            enviarPeticion('/tienda', 'PUT', data, function(data) {
                $('#modalConfirmacio').modal('show');
            });
        }

    </script>

    <!-- Modal confirmacio de guardado -->
    <div class="modal fade" id="modalConfirmacio" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Perfil actualizado correctamente</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

@endsection
