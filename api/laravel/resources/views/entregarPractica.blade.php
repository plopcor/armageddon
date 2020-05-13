@extends('layouts.app')

@section('content')
<div class="container">
                <h2>Add New Practica</h2>

                @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>ERROR!</strong> Eres un pleb.
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

<form method="POST" action="/newPractica" enctype="multipart/form-data">

    <div class="form-group">
        <textarea name="contenido" class="form-control"></textarea>
    </div>

    <div class="form-group">
        <input type="file" name="file" class="form-control">
    </div>


    <div class="form-group">
        <button type="submit" class="btn btn-primary">Entregar Practica</button>
    </div>
{{ csrf_field() }}
</form>


</div>
@endsection
