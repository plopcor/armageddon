@extends('layouts.app')

@section('content')
<div class="container">
    <!-- si estas logueado -->
                @if (Auth::check())

                        @if ($message = Session::get('success'))
                        <div class="alert alert-success alert-block">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                                <strong>{{ $message }}</strong>
                        </div>
                        <img src="uploads/{{ Session::get('file') }}">
                        @endif

                        <!-- si eres un alumno -->
                            @if(!$user->professor)
                                <table class="table">
                                    <thead><tr>
                                        <th colspan="2">Practicas</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- eso te devuelve todas las practicas del usuario en un array. Gracias a las relaciones-->
                                @foreach($user->practicas as $prac)
                                    <tr>
                                        <td>
                                            {{$prac->contenido}}
                                        </td>
                                        <td>
                                            {{$prac->created_at}}
                                        </td>
                                        <td>

                                            <a href={{'uploads/' . $prac->path}}>Descarregar</a>
                                        </td>

                                    </tr>


                                @endforeach</tbody>
                                </table>
                                <a href="/newPractica" class="btn btn-primary">Enviar Practica</a>
                    <!-- si eres un profesor -->
                            @else
                                <table class="table">
                                    <thead><tr>
                                        <th colspan="2">HOLA PROFE GUAY Y MARAVILLOSO Y SORPRENDEMENTE ATRACTIVO</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($practicas as $prac)
                                    <tr>
                                        <td>
                                            {{$prac->user->name}}
                                        </td>
                                        <td>
                                            {{$prac->contenido}}
                                        </td>
                                        <td>
                                            {{$prac->created_at}}
                                        </td>
                                        <td>

                                            <a href={{'uploads/' . $prac->path}}>Descarregar</a>
                                        </td>
                                        <td>
                                            <a href="/corrigePractica/{{$prac->id}}" class="btn btn-primary">Corregir Practica</a>
                                        </td>

                                    </tr>


                                @endforeach
                                </tbody>
                                </table>




                            @endif
                @else
                    <h3>You need to log in. <a href="/login">Click here to login</a></h3>
                @endif

</div>
@endsection
