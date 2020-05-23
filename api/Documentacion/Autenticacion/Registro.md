# Registro

Informacion sobre esta ruta, lo que hace y devuelve

**URL** : `/register`

**Metodo** : `POST`

**Auth requerida** : NO

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true,
    "data": {
        "token": "<TOKEN>",
        "usuario": {
            "id": 1,
            "nombre": "Usuario 1",
            "usuario": "usuario1",
            "email": "usuario1@mail.com",
            "email_verified_at": null,
            "created_at": "2020-12-31 00:00:00",
            "updated_at": "2020-12-31 00:00:00",
            "avatar": null,
            "esTienda": 0
        }
    }
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### 409 Conflict

El usuario ya existe, ha de escojer otro nombre

**Codigo** : `409 Conflict`

**Contenido** :

```json
{
    "success": false,
    "message": "Datos incorrectos",
    "data": {
        "usuario": [
            "The usuario has already been taken."
        ]
    }
}
```


## Notas
