# Listar

Listar todos los pedidos del usuario

**URL** : `/usuario/pedidos`

**Metodo** : `GET`

**Auth requerida** : SI

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

Devuelve lista de pedidos

```json
{
    "success": true,
    "data": [
        {
            "id": 1,
            "id_usuario": 1,
            "id_tienda": 1,
            "estado": "CREADO",
            "recogida": "2020-05-29 03:02:40",
            "created_at": "2020-05-29 03:02:40",
            "updated_at": null,
            "productos": [
                {
                    "id": 1,
                    "id_tienda": 1,
                    "id_producto": 1,
                    "precio": 4.8,
                    "disponible": true,
                    "created_at": "2020-05-29 03:02:40",
                    "updated_at": null,
                    "pivot": {
                        "id_pedido": 1,
                        "id_producto": 1,
                        "cantidad": 1,
                        "precio_unidad": "1.50"
                    }
                }
            ]
        },
        {
            "id": 2,
            "id_usuario": 1,
            "id_tienda": 1,
            "estado": "CREADO",
            "recogida": "2020-05-29 03:02:40",
            "created_at": "2020-05-29 03:02:40",
            "updated_at": null,
            "productos": [
                {
                    "id": 2,
                    "id_tienda": 1,
                    "id_producto": 2,
                    "precio": 2.3,
                    "disponible": true,
                    "created_at": "2020-05-29 03:02:40",
                    "updated_at": null,
                    "pivot": {
                        "id_pedido": 2,
                        "id_producto": 2,
                        "cantidad": 2,
                        "precio_unidad": "1.60"
                    }
                },
                {
                    "id": 4,
                    "id_tienda": 1,
                    "id_producto": 4,
                    "precio": 1.3,
                    "disponible": true,
                    "created_at": "2020-05-29 03:02:40",
                    "updated_at": null,
                    "pivot": {
                        "id_pedido": 2,
                        "id_producto": 4,
                        "cantidad": 1,
                        "precio_unidad": "2.00"
                    }
                }
            ]
        }
    ]
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

## Notas
