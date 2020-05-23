# Login

Iniciar sesión

**URL** : `/login`

**Metodo** : `POST`

**Auth requerida** : NO

**Datos** :
```json
{
  "usuario": "<String>",
  "contraseña": "<String>",
}
```

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

#### 404 Not Found

Las credenciales no corresponden a ningun usuario

**Codigo** : `404 Not Found`

**Contenido** :

```json
{
    "success": false,
    "message": "Error de autenticacion",
    "data": [
        "Usuario o contraseña incorrectos"
    ]
}
```

## Notas
