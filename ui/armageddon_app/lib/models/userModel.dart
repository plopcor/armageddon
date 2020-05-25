// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String nombre;
  String usuario;
  String email;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic avatar;
  int esTienda;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        usuario: json["usuario"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        avatar: json["avatar"],
        esTienda: json["esTienda"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "usuario": usuario,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "avatar": avatar,
        "esTienda": esTienda,
      };

  @override
  String toString() {
    return 'id: $id - usuario: $usuario';
  }
}
