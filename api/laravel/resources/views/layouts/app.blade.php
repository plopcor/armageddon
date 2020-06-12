@extends('layouts.base')

@section('body')
<body>
    <nav class="navbar navbar-expand-md navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
        <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="{{ url('/') }}">{{ config('app.name', 'Laravel') }}</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!--    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">-->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav px-3 ml-auto">
                <li class="nav-item dropdown">
                    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                        {{ Auth::user()->nombre }} <span class="caret"></span>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="{{ route('perfil') }}">Perfil</a>
                        <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                            {{ __('Logout') }}
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link {{ Request::is('/') ? 'active' : '' }}" href="{{ url('/')  }}">
                                <span data-feather="home"></span>
                                Panel <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ Route::is('pedidos') ? 'active' : '' }}" href="{{ route('pedidos') }}">
                                <span data-feather="file"></span>
                                Pedidos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ Route::is('productos') ? 'active' : '' }}" href="{{ route('productos') }}">
                                <span data-feather="shopping-cart"></span>
                                Productos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ Route::is('clientes') ? 'active' : '' }}" href="{{ route('clientes') }}">
                                <span data-feather="users"></span>
                                Clientes
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ Route::is('estadisticas') ? 'active' : '' }}" href="{{ route('estadisticas') }}">
                                <span data-feather="bar-chart-2"></span>
                                Estadisticas
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ Request::is('perfil') ? 'active' : '' }}" href="{{ route('perfil') }}">
                                <span data-feather="layers"></span>
                                Tienda
                            </a>
                        </li>
                    </ul>

                    <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                        <span>Estadisticas y reportes</span>
                        <a class="d-flex align-items-center text-muted" href="#">
                            <span data-feather="plus-circle"></span>
                        </a>
                    </h6>
                    <ul class="nav flex-column mb-2">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="file-text"></span>
                                Mes actual
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="file-text"></span>
                                Ultimo trimestre
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span data-feather="file-text"></span>
                                Ultimo año
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
                @yield('content')
            </main>
        </div>
    </div>
</body>
@endsection
