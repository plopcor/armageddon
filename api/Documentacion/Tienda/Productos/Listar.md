# Listar

Listar todos los productos de nuestra tienda

**URL** : `/tienda/productos`

**Metodo** : `GET`

**Auth requerida** : SI

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "id_tienda": 1,
            "id_producto": 1,
            "precio": 3.8,
            "disponible": true,
            "created_at": "2020-12-30 23:00:00",
            "updated_at": null,
            "producto": {
                "id": 1,
                "nombre": "<Nombre producto>",
                "img_path": "<URL>",
                "esEspecifico": 0,
                "created_at": "2020-12-30 23:00:00",
                "updated_at": null
            }
        },
        {
            "id": 2,
            "id_tienda": 1,
            "id_producto": 2,
            "precio": 4.4,
            "disponible": true,
            "created_at": "2020-12-30 23:00:00",
            "updated_at": null,
            "producto": {
                "id": 2,
                "nombre": "<Nombre producto>",
                "img_path": "<URL>",
                "esEspecifico": 0,
                "created_at": "2020-12-30 23:00:00",
                "updated_at": null
            }
        },
        {
            "id": 3,
            "id_tienda": 1,
            "id_producto": 3,
            "precio": 1.4,
            "disponible": true,
            "created_at": "2020-12-30 23:00:00",
            "updated_at": null,
            "producto": {
                "id": 3,
                "nombre": "<Nombre producto>",
                "img_path": "<URL>",
                "esEspecifico": 0,
                "created_at": "2020-12-30 23:00:00",
                "updated_at": null
            }
        }
    ]
}
```

## Respuesta Incorrecta

#### 404 Not Found
Mensajes:
* La Tienda especificada no existe

## Notas
