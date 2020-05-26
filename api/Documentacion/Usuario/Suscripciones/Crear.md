# Crear

Crear una nueva suscripcion si no existe

**URL** : `/usuario/suscripcion/{idTienda}`

**Metodo** : `POST`

**Auth requerida** : SI

**Datos** :

* {idTienda}: ID de la Tienda a la que suscribirse

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

Si aun no esta suscrito a la tienda :
```json
{
    "success": true
}
```

Si ja esta suscrito a la tienda :
```json
{
    "success": true,
    "message": "El usuario ja esta suscrito"
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

#### 500 Internal Server Error

Error al crear y/o guardar la suscripcion en la base de datos

**Codigo** : `500 Internal Server Error`

**Contenido** :

```json
{
    "success": false,
    "message": "Error al crear o guardar la suscripcion",
}
```

## Notas
