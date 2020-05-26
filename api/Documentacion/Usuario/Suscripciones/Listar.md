# Listar

Listar todas las suscripciones del usuario actual

**URL** : `/usuario/suscripcion/{idTienda}`

**Metodo** : `DELETE`

**Auth requerida** : SI

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "tienda": {
                "id": 1,
                "nombre": "Nombre Tienda 1",
                "id_propietario": 2,
                "longitud": "0.0000000",
                "latitud": "0.00000000",
                "created_at": "2020-12-30 00:00:00",
                "updated_at": null
            }
        },
        {
            "id": 2,
            "tienda": {
                "id": 2,
                "nombre": "Nombre Tienda 2",
                "id_propietario": 3,
                "longitud": "0.0000000",
                "latitud": "0.00000000",
                "created_at": "2020-12-30 00:00:00",
                "updated_at": null
            }
        },
    ]
}
```


## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### 404 Not Found

La tienda especificada no existe

**Codigo** : `404 Not Found`

**Contenido** :

```json
{
    "success": false,
    "message": "Tienda no encontrada",
}
```


## Notas