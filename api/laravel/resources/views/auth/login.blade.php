@extends('layouts.base')

@section('head')
    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
    <title>Login</title>
@endsection

@section('body')
<body class="text-center">
    <form class="form-signin" method="POST" action="{{ route('login') }}">
    @csrf

        <!-- LOGO -->
        <img class="mb-4" src="https://getbootstrap.com/docs/4.0/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">

        <!-- INICIAR SESION -->
        <h1 class="h3 mb-3 font-weight-normal">Iniciar sesión</h1>

        <!-- Usuario -->
        <label for="usuario" class="sr-only">Usuario</label>
        <input id="usuario" type="usuario" class="form-control @error('usuario') is-invalid @enderror" name="usuario" value="{{ old('usuario') }}" placeholder="Usuario" required  autofocus>

        <!-- Contraseña -->
        <label for="password" class="sr-only">Contraseña</label>
        <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Coantraseña" required autocomplete="current-password">

        <!-- Recordar-me -->
        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Recordar-me
            </label>
        </div>

        <!-- Errores -->
        @if($errors->any())
            <div class="mb-3">
                <span role="alert">
                    @foreach ($errors->all() as $error)
                        <p><strong>{{ $error }}</strong></p>
                    @endforeach
                </span>
            </div>
        @endif

        <!-- Acceder -->
        <button class="btn btn-lg btn-primary btn-block" type="submit">Acceder</button>

        <!-- Copyright -->
        <p class="mt-5 mb-3 text-muted">&copy; 2020-2021</p>
    </form>
</body>

@endsection
