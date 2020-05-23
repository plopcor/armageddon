# Autenticación - Errores

Posibles errores en la autenticación

## Lista de errores

#### 409 Conflict

El usuario ya existe, ha de escojer otro nombre

**Codigo** : `409 Conflict`

**Contenido** :

```json
{
    "success": false,
    "message": "Datos incorrectos",
    "data": {
        "usuario": [
            "The usuario has already been taken."
        ]
    }
}
```

#### 401 Unauthorized

El token enviado es invalido

**Codigo** : `401 Unauthorized`

**Contenido** :

```json
{
    "message": "Unauthenticated."
}
```

## Notas
