# Editar

Editar perfil de nuestra tienda

**URL** : `/tienda`

**Metodo** : `PUT`

**Auth requerida** : SI

**Datos** :
```json
ATENCION: Enviar datos en "x-www-form-urlencoded", no en "form-data"

{
  "nombre": "[opcional] <String>",
  "longitud": "[opcional] <Numeric [-180 => 180]>",
  "latitud": "[opcional] <Numeric [-90 => 90]>",
  "imagen": "[opcional] <URL>"
}
```

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
* No has creado ninguna tienda

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

## Notas
