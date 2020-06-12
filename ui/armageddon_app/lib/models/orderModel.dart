// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:armageddon_app/models/productModel.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  Order(
      {this.idUsuario,
      this.idTienda,
      this.estado,
      this.recogida,
      this.codigoQr,
      this.createdAt,
      this.updatedAt,
      this.productos,
      this.id});

  int idUsuario;
  int idTienda;
  int id;
  String estado;
  DateTime recogida;
  String codigoQr;
  DateTime createdAt;
  DateTime updatedAt;
  List<Product> productos;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      idUsuario: json["id_usuario"],
      idTienda: json["id_tienda"],
      estado: json["estado"],
      recogida: json["recogida"] != null ? DateTime.parse(json["recogida"]) : null,
      codigoQr: json["codigo_qr"],
      createdAt: json["created_at"] != null
          ? DateTime.parse(json["created_at"])
          : null,
      updatedAt: json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null,
      productos: json["productos"] != null
          ? List<Product>.from(
              json["productos"].map((x) => Product.fromJson(x['producto'])))
          : new List<Product>(),
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "id_tienda": idTienda,
        "estado": estado,
        "recogida": recogida.toIso8601String(),
        "codigo_qr": codigoQr,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "productos": List<Product>.from(productos.map((x) => x)),
        "id": id
      };
}
