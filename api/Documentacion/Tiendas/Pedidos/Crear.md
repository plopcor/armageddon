# Crear

Crear un pedido con productos de la tienda

**URL** : `/tienda/{idTienda}/pedido`

**Metodo** : `POST`

**Auth requerida** : SI

**Datos** :

```json
{
  "productos" = [
    [ "id": "[id producto] <Integer>", "cantidad": "<Integer>" ],
    [ "id": "[id producto] <Integer>", "cantidad": "<Integer>" ]
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
        "id_usuario": 2,
        "id_tienda": 1,
        "estado": "CREADO"
    }
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### 404 Not Found

Uno de los productos seleccionados no esta en esta Tienda


#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
