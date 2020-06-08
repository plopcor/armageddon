# Editar

Editar los datos del usuario actual

**URL** : `/usuario`

**Metodo** : `PUT`

**Auth requerida** : SI

**Datos** :

```json
ATENCION: Enviar datos en "x-www-form-urlencoded", no en "form-data"

{
  "nombre": "[opcional] <String>",
  "email": "[opcional] <Email>",
  "avatar": "[opcional] <URL>"
}
```

## Respuesta Correcta

**Codigo** : `200 OK`

**Ejemplo contenido**

```json
{
    "success": true
}
```

## Respuesta Incorrecta

#### [400 Bad Request](../General/Errores.md#400-bad-request)

#### [500 Internal Server Error](../General/Errores.md#500-internal-server-error)

* Error al actualizar los datos

## Notas
