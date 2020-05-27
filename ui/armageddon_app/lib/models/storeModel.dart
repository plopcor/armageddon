// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  int id;
  String nombre;
  int idPropietario;
  String longitud;
  String latitud;
  DateTime createdAt;
  DateTime updatedAt;

  Store({
    this.id,
    this.nombre,
    this.idPropietario,
    this.longitud,
    this.latitud,
    this.createdAt,
    this.updatedAt,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        nombre: json["nombre"],
        idPropietario: json["id_propietario"],
        longitud: json["longitud"],
        latitud: json["latitud"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "id_propietario": idPropietario,
        "longitud": longitud,
        "latitud": latitud,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };

  @override
  String toString() {
    return 'id: $id - nombre: $nombre';
  }
}
