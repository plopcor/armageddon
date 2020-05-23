// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool success;
  Data data;

  User({
    this.success,
    this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
      };
}

class Data {
  String token;
  Usuario usuario;

  Data({
    this.token,
    this.usuario,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "usuario": usuario.toJson(),
      };
}

class Usuario {
  int id;
  String nombre;
  String usuario;
  String email;
  dynamic emailVerifiedAt;
  dynamic createdAt;
  dynamic updatedAt;
  String avatar;
  int esTienda;

  Usuario({
    this.id,
    this.nombre,
    this.usuario,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.avatar,
    this.esTienda,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        usuario: json["usuario"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        avatar: json["avatar"],
        esTienda: json["esTienda"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "usuario": usuario,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "avatar": avatar,
        "esTienda": esTienda,
      };
}
