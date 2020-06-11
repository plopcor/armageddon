# Crear

Crear un pedido con productos de la tienda

**URL** : `/tienda/{idTienda}/pedido`

**Metodo** : `POST`

**Auth requerida** : SI

**Datos** :

```json
{
  "productos" : [
    [ "id": "<ID ProductoTienda | Integer>", "cantidad": "<Integer>" ],
    [ "id": "<ID ProductoTienda | Integer>", "cantidad": "<Integer>" ]
  ]
}
```

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

Devuelve el pedido

```json
{
    "success": true,
    "data": {
        "id_usuario": 1,
        "id_tienda": 1,
        "estado": "CREADO",
        "recogida": "2020-06-11 18:58:13",
        "updated_at": "2020-06-11 18:58:13",
        "created_at": "2020-06-11 18:58:13",
        "id": 5
    }
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### [404 Not Found](../General/Errores.md#404-not-found)
Mensajes:
* La tienda no existe
* Uno de los productos seleccionados no existe en la Tienda

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
