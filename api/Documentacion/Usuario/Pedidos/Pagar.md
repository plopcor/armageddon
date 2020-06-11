# Pagar

Pagar un pedido (pasar estado a "PAGADO") y generar el codigo QR

**URL** : `/usuario/pedido/{idPedido}/pagar`

**Metodo** : `POST`

**Auth requerida** : SI

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo Contenido**

Devuelve el pedido con la tienda donde se ha realizado

```json
{
    "success": true,
    "data": {
        "id": 4,
        "id_usuario": 1,
        "id_tienda": 1,
        "estado": "PAGADO",
        "recogida": "2020-12-30 00:00:00",
        "codigo_qr": "/qrcodes/a87ff679a2f3e71d9181a67b7542122c.png",
        "created_at": "2020-12-30 00:00:00",
        "updated_at": "2020-12-30 00:00:0",
        "tienda": {
            "id": 1,
            "nombre": "Nombre Tienda",
            "id_propietario": 5,
            "longitud": "60.0000000",
            "latitud": "60.0000000",
            "imagen": "https://dominio.com/imagenes/tienda.jpg",
            "created_at": "2020-12-30 00:00:00",
            "updated_at": null
        }
    }
}
```

## Respuesta Incorrecta

#### [404 Not Found](../General/Errores.md#404-not-found)
Mensajes:
* El pedido no existe

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
