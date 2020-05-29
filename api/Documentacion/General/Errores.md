# Errores generales

Posibles errores en la API

## Lista de errores

#### 400 Bad Request

Faltan datos en la peticion o el formato de los datos es invalido

**Codigo** : `400 Bad Request`

**Contenido** :

```json
{
    "success": false,
    "message": "Datos incorrectos",
    "data": {
        "<campo>": [
            "The <campo> field <error de validacion>."
        ],
        "<campo>": [
            "The <campo> field <error de validacion>."
        ]
    }
}
```

**Contenido ejemplo** :

Login sin enviar los parametros "usuario" ni "contraseña"
```json
{
    "success": false,
    "message": "Datos incorrectos",
    "data": {
        "usuario": [
            "The usuario field is required."
        ],
        "contraseña": [
            "The contraseña field is required."
        ]
    }
}
```

#### 404 Not Found

No se ha encontrado un recurso necessario para completar la accion

**Codigo** : `404 Not Found`

**Contenido** :

*ATENCION: El mensaje puede canviar para explicar que recurso no ha encontrado*

```json
{
    "success": false,
    "message": "No se ha encontrado el recurso",
}
```


#### 500 Internal Server Error

Error al crear o guardar el recurso en la base de datos

**Codigo** : `500 Internal Server Error`

**Contenido** :

```json
{
    "success": false,
    "message": "No se ha podido modificar el recurso en la base de datos"
}
```



## Notas
