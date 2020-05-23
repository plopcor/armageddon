# Login

Iniciar sessión

**URL** : `/login`

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

**Codigo** : `404 Not Found`

**Ejemplo contenido**

Credenciales invalidas

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

* Notas de cosas sobre la peticion, si haces esto pasara eso etc
