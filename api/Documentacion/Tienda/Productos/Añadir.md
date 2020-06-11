# Añadir

Añadir uno de los productos disponibles (ya creados en el sistema) a nuestra tienda

**URL** : `/tienda/producto`

**Metodo** : `POST`

**Auth requerida** : SI

**Datos** :

```json
{
  "idProducto": "<ID Producto | Numeric | String>",
  "precio": "<Numeric [0 => 99999,99]>",
  "disponible": "[opcional] <Boolean>"
}
```

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true,
    "data": {
        "id_tienda": 3,
        "id_producto": "<ID Producto>",
        "precio": "<precio>",
        "disponible": true,
        "updated_at": "2020-12-30 23:00:00",
        "created_at": "2020-12-30 23:00:00",
        "id": 9
    }
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### [409 Conflict](../General/Errores.md#409-conflict)
Mensajes:
* El producto ya esta en la tienda

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
