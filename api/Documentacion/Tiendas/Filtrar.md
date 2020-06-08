# Listar

Filtrar las tiendas disponibles por:
- Geolocalizacion


**URL** : `/tiendas/filtrar`

**Metodo** : `GET`

**Auth requerida** : SI

**Datos**
```json
{
  "longitud": "[opcional] <Numeric [-180 => 180]>",
  "latitud": "[opcional] <Numeric [-90 => 90]>",
  "radio": "[opcional, default=5] <Numeric>"
}
```

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

Lista de las tiendas dentro del radio

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "nombre": "Cafe Esquina",
            "id_propietario": 5,
            "longitud": "41.393223",
            "latitud": "2.167992",
            "imagen": "<URL>",
            "created_at": "2020-12-30 00:00:00",
            "updated_at": null
        }
    ]
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)
* Si se especifica una Latitud tambíen se ha de especificar una Longitud

## Notas
* Se ha de especificar una Latitud y Longitud para que el Radio se tome en cuenta
