# Listar Tokens

Listar todos los tokens disponibles (creados y que no han sido destruidos)

**URL** : `/tokens`

**Metodo** : `GET`

**Auth requerida** : SI

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true,
    "data": [
      {
          "id": 0,
          "user_id": 5,
          "client_id": 1,
          "name": "<Nombre>",
          "scopes": "[]",
          "revoked": 0,
          "created_at": "2020-12-30 23:00:00",
          "updated_at": "2020-12-30 23:00:00",
          "expires_at": "2020-12-30 23:00:00"
      },
      {
          "id": 0,
          "user_id": 5,
          "client_id": 1,
          "name": "<Nombre>",
          "scopes": "[]",
          "revoked": 0,
          "created_at": "2020-12-30 23:00:00",
          "updated_at": "2020-12-30 23:00:00",
          "expires_at": "2020-12-30 23:00:00"
      }
    ]
}
```

## Respuesta Incorrecta

#### [401 Unauthorized](Errores.md#401-unauthorized)

## Notas
