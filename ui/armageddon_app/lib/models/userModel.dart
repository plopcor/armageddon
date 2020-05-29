// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'userModel.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  int id;
  @HiveField(1)
  String nombre;
  @HiveField(2)
  String usuario;
  @HiveField(3)
  String email;
  @HiveField(4)
  dynamic createdAt;
  @HiveField(5)
  dynamic updatedAt;
  @HiveField(6)
  String avatar;
  @HiveField(7)
  int esTienda;

  User({
    this.id,
    this.nombre,
    this.usuario,
    this.email,
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
        "created_at": createdAt,
        "updated_at": updatedAt,
        "avatar": avatar,
        "esTienda": esTienda,
      };
}
