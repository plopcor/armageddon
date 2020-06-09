# Listar

Listar todas los favoritos del usuario actual

**URL** : `/usuario/favoritos`

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
            "nombre": "Fav. 1",
            "id_usuario": 1,
            "id_pedido": 1
        },
        {
            "id": 2,
            "nombre": "Fav. 2",
            "id_usuario": 1,
            "id_pedido": 2
        }
    ]
}
```


## Respuesta Incorrecta

## Notas
