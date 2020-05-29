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
