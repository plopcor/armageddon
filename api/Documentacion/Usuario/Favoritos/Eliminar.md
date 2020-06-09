# Eliminar

Eliminar un pedido Favorito

**URL** : `/usuario/favorito/{idFavorito}`

**Metodo** : `DELETE`

**Auth requerida** : SI

**Datos** :

* {idFavorito}: ID del Favorito

## Respuesta Correcta

**Codigo** : `200 OK`

**Contenido**

```json
{
    "success": true
}
```


## Respuesta Incorrecta

#### [404 Not Found](../General/Errores.md#404-not-found)
Mensajes:
* El Favorito especificado no existe

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
