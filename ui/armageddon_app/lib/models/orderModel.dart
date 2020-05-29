// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

import 'package:armageddon_app/models/productModel.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    int id;
    int idUsuario;
    int idTienda;
    String estado;
    DateTime recogida;
    DateTime createdAt;
    dynamic updatedAt;
    List<Product> productos;

    Order({
        this.id,
        this.idUsuario,
        this.idTienda,
        this.estado,
        this.recogida,
        this.createdAt,
        this.updatedAt,
        this.productos,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        idUsuario: json["id_usuario"],
        idTienda: json["id_tienda"],
        estado: json["estado"],
        recogida: DateTime.parse(json["recogida"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        productos: List<Product>.from(json["productos"].map((x) => Product.fromJson(x['producto']))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_usuario": idUsuario,
        "id_tienda": idTienda,
        "estado": estado,
        "recogida": recogida.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "productos": List<dynamic>.from(productos.map((x) => x.toJson())),
    };
}

class ProductoElement {
    int id;
    int idTienda;
    int idProducto;
    double precio;
    bool disponible;
    DateTime createdAt;
    dynamic updatedAt;
    Pivot pivot;
    ProductoProducto producto;

    ProductoElement({
        this.id,
        this.idTienda,
        this.idProducto,
        this.precio,
        this.disponible,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.producto,
    });

    factory ProductoElement.fromJson(Map<String, dynamic> json) => ProductoElement(
        id: json["id"],
        idTienda: json["id_tienda"],
        idProducto: json["id_producto"],
        precio: json["precio"].toDouble(),
        disponible: json["disponible"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        pivot: Pivot.fromJson(json["pivot"]),
        producto: ProductoProducto.fromJson(json["producto"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "id_tienda": idTienda,
        "id_producto": idProducto,
        "precio": precio,
        "disponible": disponible,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "pivot": pivot.toJson(),
        "producto": producto.toJson(),
    };
}

class Pivot {
    int idPedido;
    int idProducto;
    int cantidad;
    String precioUnidad;

    Pivot({
        this.idPedido,
        this.idProducto,
        this.cantidad,
        this.precioUnidad,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        idPedido: json["id_pedido"],
        idProducto: json["id_producto"],
        cantidad: json["cantidad"],
        precioUnidad: json["precio_unidad"],
    );

    Map<String, dynamic> toJson() => {
        "id_pedido": idPedido,
        "id_producto": idProducto,
        "cantidad": cantidad,
        "precio_unidad": precioUnidad,
    };
}

class ProductoProducto {
    int id;
    String nombre;
    String imgPath;
    int esEspecifico;
    DateTime createdAt;
    dynamic updatedAt;

    ProductoProducto({
        this.id,
        this.nombre,
        this.imgPath,
        this.esEspecifico,
        this.createdAt,
        this.updatedAt,
    });

    factory ProductoProducto.fromJson(Map<String, dynamic> json) => ProductoProducto(
        id: json["id"],
        nombre: json["nombre"],
        imgPath: json["img_path"],
        esEspecifico: json["esEspecifico"],
        createdAt: DateTime.parse(json["created_at"]),
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
}
