@extends('layouts.app')

@section('content')
<div class="container">
    <!-- si estas logueado -->
                @if (Auth::check())



                        <!-- si eres un alumno -->
                            @if(!Auth::user()->professor)
                                <h2> Trampos </h2>
                    <!-- si eres un profesor -->
                            @else
                                <h2> corregir </h2>



                            @endif
                @else
                    <h3>You need to log in. <a href="/login">Click here to login</a></h3>
                @endif

</div>
@endsection
