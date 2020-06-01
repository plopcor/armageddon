<?php

namespace App\Http\Controllers;
use Auth;
//use App\Auth;
use App\Practica;
//importa tota la DB
use DB;
//importa el model User, equivalent a la taula users
use App\User;
use Illuminate\Http\Request;

class PracticasController extends Controller
{

//ejemplos de funciones
    public function FuncionesRandom(){
        //array de PHP con todas las practicas
        $practicas = Practica::all() ;
        //count practicas
        Practica::all()->count();
        //where. si. not a prank
        //Practica::Where('id','=','4');
        //devuelve true si estas registrado
        $bool = Auth::check();
        //devuelve el usuario registrado
        $userId = Auth::id();
        $user = Auth::user();
        $practicas_user = Practica::Where('user_id','=',$userId);
    }
    public function hola()
    {
        return view('hola');
    }

    public function verMisPracticas()
    {
        //  ¯\_(ツ)_/¯

        $user = Auth::user();
        $practicas = Practica::all();
        return view('misPracticas',compact('user','practicas'));
    }

    public function nuevaPractica()
    {
        $practica = new Practica();
        $practica->contenido = 'a';
        $practica->user_id = Auth::id();
        $practica->save();

        return redirect('misPracticas');

    }

    public function corrigePractica(Practica $prac)
    {
        if(Auth::check() && Auth::user()->professor){
            return view('corrigePractica');
        }
    }

    public function entregarPractica()
    {
        return view('entregarPractica');
    }

    ///viene de un post de un formulario con lo que tiene un request
    public function subirPractica(Request $Request)
    {
        //validacion, si no la cumple peta
        $Request->validate([
            //el campo file es obligatorio, debe ser extension pdf xlx o csv, tamaño maximo 2MB
            'file' => 'required|mimes:pdf,xlx,csv|max:2048',
        ]);

        //nombre del fichero sacado a aprtir del time
        $fileName = time().'.'.$Request->file->extension();

        //mover el fichero a la capeta public/uploads con el nombre generado anteriorkmente
        $Request->file->move(public_path('uploads'), $fileName);

        $practica = new Practica();
        $practica->contenido = $Request->contenido;
        $practica->user_id = Auth::id();
        //la nueva variable path
        $practica->path = $fileName;
        $practica->save();

        //puedes añadirle un campo a un redirect o return
        return redirect('misPracticas')->with('success','Practica entregada.');

    }
}
