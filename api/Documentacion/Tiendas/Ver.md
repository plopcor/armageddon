# Ver

Ver el perfil de la tienda especificada

**URL** : `/tienda/{idTienda}`

**Metodo** : `GET`

**Auth requerida** : SI

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json

{
    "success": true,
    "data": {
        "id": 1,
        "nombre": "Nombre Tienda 1",
        "id_propietario": 2,
        "longitud": "0.0000000",
        "latitud": "0.00000000",
        "imagen": "https://dosg.net/wp-content/uploads/2018/03/cafeteria.jpg",
        "created_at": "2020-12-30 00:00:00",
        "updated_at": null
    }
}
```


## Respuesta Incorrecta

#### [404 Not Found](../General/Errores.md#404-not-found)
Mensajes:
* Tienda no encontrada

## Notas
