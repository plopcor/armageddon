// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  List<Producto> productos;

  Cart({
    this.productos,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productos: List<Producto>.from(
            json["productos"].map((x) => Producto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toJson())),
      };

  List<Producto> getProductos() {
    return productos;
  }
}

class Producto {
  String id;
  String cantidad;
  String nombre;
  String imgPath;

  Producto({
    this.id,
    this.cantidad,
    this.nombre,
    this.imgPath,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        cantidad: json["cantidad"],
        nombre: json["nombre"],
        imgPath: json["imgPath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "nombre": nombre,
        "imgPath": imgPath,
      };
}
