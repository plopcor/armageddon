// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

/* {
  "productos" : [
    { "id": "<ID ProductoTienda | Integer>", "cantidad": "<Integer>" },
    { "id": "<ID ProductoTienda | Integer>", "cantidad": "<Integer>" }
  ]
} */

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart cart) => json.encode(cart.toJson());

class Cart {
  Cart({this.productos});

  List<Producto> productos;

  addProduct(Producto p) {
    if (productos == null) {
      productos = [];
    }

    var index = productos.indexWhere((element) => element.compare(p));

    if (index != -1)
      ++productos[index].cantidad;
    else
      productos.add(p);
  }

  deleteProduct(int index) {
    if (productos.isNotEmpty) {
      if (productos[index].cantidad > 1)
        --productos[index].cantidad;
      else
        productos.removeAt(index);
    }
  }

  Future<int> length() async {
    if (productos == null) {
      productos = [];
    }
    return productos.length;
  }

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        productos: List<Producto>.from(
            json["productos"].map((x) => Producto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productos": List<dynamic>.from(productos.map((x) => x.toJson())),
      };
}

class Producto {
  Producto({
    this.id,
    this.cantidad,
    this.nombre,
  });

  int id;
  int cantidad;
  String nombre;

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        cantidad: json["cantidad"],
        nombre: json["nombre"],
      );

  bool compare(Producto p) {
    if (p.nombre == this.nombre)
      return true;
    else
      return false;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "nombre": nombre,
      };
}
