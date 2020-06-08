# Ver

Ver perfil de nuestra tienda

**URL** : `/tienda`

**Metodo** : `GET`

**Auth requerida** : SI

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

#### [404 Not Found](../General/Errores.md#404-not-found)
Mensajes:
* No has creado ninguna tienda

## Notas
