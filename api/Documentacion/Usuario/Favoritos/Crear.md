# Crear

Añadir un pedido a Favoritos

**URL** : `/usuario/pedido/{idPedido}/favorito`

**Metodo** : `POST`

**Auth requerida** : SI

**Datos** :

* {idPedido}: ID del pedido

```json
{
  "nombre": "[opcional] <Nombre para el favorito | String>"
}
```

## Respuesta Correcta

**Codigo** : `200 OK`

**Contenido**

```json
{
    "success": true
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### [404 Not Found](../General/Errores.md#404-not-found)
Mensajes:
* El Pedido especificado no existe

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
