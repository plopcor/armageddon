# Ver

Ver producto de nuestra tienda

**URL** : `/tienda/producto/{id}`

**Metodo** : `GET`

**Auth requerida** : SI

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true,
    "data": {
        "id": 2,
        "id_tienda": 2,
        "id_producto": 2,
        "precio": 2,
        "disponible": false,
        "created_at": "2020-12-30 23:00:00",
        "updated_at": "2020-12-30 23:00:00",
        "producto": {
            "id": 2,
            "nombre": "Cafe con leche",
            "img_path": "<URL>",
            "esEspecifico": 0,
            "created_at": "2020-12-30 23:00:00",
            "updated_at": "2020-12-30 23:00:00"
        }
    }
}
```

## Respuesta Incorrecta

#### [404 Not Found](../General/Errores.md#404-not-found)
Mensajes:
* No has creado ninguna tienda
* El producto no existe en la tienda

## Notas
