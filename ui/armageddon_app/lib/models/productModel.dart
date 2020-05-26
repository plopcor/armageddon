// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String nombre;
  String imgPath;
  int esEspecifico;
  DateTime createdAt;
  dynamic updatedAt;

  Product({
    this.id,
    this.nombre,
    this.imgPath,
    this.esEspecifico,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nombre: json["nombre"],
        imgPath: json["img_path"],
        esEspecifico: json["esEspecifico"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "img_path": imgPath,
        "esEspecifico": esEspecifico,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
  @override
  String toString() {
    return 'id: $id - name: $nombre';
  }
}
