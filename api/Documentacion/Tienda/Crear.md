# Crear

Crear una nueva tienda

**URL** : `/tienda`

**Metodo** : `POST`

**Auth requerida** : SI

**Datos** :

```json
{
  "nombre": "<String>",
  "longitud": "[opcional] <Numeric [-180 => 180]>",
  "latitud": "[opcional] <Numeric [-90 => 90]>",
  "imagen": "[opcional] <URL>"
}
```

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true,
    "data": {
        "nombre": "Nombre Tienda",
        "id_propietario": 1,
        "updated_at": "2020-12-30 00:00:00",
        "created_at": "2020-12-30 00:00:00",
        "id": 1
    }
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### [409 Conflict](../General/Errores.md#409-conflict)
Mensajes:
* Ya tienes una tienda creada

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
