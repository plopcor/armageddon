# Introducción

Introducción a la autenticación de la API

## Terminos
**Auth requerida** : Indica si la ruta necessita autenticación.

**Token de acceso** : Token proporcionado por la API (al hacer login o registrarse) que permite hacer peticiones como nuestro usuario (sin enviar las credenciales constantemente).

## Información

### Auth requerida

Se debe enviar el token de acceso en el Header de la peticion para autenticarla.

**Header** :
```json
{
  "Accept": "application/json",
  "Authorization": "Bearer <token>",
}
```
**Possibles errores** :
* [401 Unauthorized](../Errores.md#401-unauthorized)


## Notas
