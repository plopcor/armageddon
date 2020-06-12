import 'dart:async';
import 'dart:convert';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/orderModel.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/models/storeModel.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:http/http.dart' as http;

/// getProducts - Get All products throught GET
Future<List<Product>> getProducts() async {
  final _url = '$apiUrl/productos';

  final _response = await http.get(_url);
  List<Product> products;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    products = (_result['data'] as List).map((e) {
      Product p = Product.fromJson(e['producto']);
      p.idTienda = e['id_tienda'];
      p.precio = e['precio'].toDouble();
      return p;
    }).toList();
  }

  return products;
}

/// getOrders - Get All favourite orders of login user throught GET
Future<List<Order>> getOrders() async {
  final _url = '$apiUrl/usuario/pedidos';

  /* take token */
  String _token = await getToken();

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });

  List<Order> orders;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);
    orders =
        (_result['data'] as List).map((e) => new Order.fromJson(e)).toList();
  }

  return orders;
}

Future<List<Order>> getFavOrders() async {
  final _url = '$apiUrl/usuario/favoritos';

  /* take token */
  String _token = await getToken();

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });

  List<Order> orders;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);
    orders =
        (_result['data'] as List).map((e) => new Order.fromJson(e)).toList();
  }

  return orders;
}

/// getStores - Get All stores throught GET
Future<List<Store>> getStores() async {
  final _url = '$apiUrl/tiendas';

  /* take token */
  String _token = await getToken();

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });
  List<Store> stores;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    stores =
        (_result['data'] as List).map((e) => new Store.fromJson(e)).toList();
  }

  return stores;
}

Future<Store> getStoreById(int idTienda) async {
  final _url = '$apiUrl/tienda/$idTienda';

  /* take token */
  String _token = await getToken();

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });

  Store store;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    store = new Store.fromJson(_result['data']);
  }
  return store;
}

/// getProductsByStoreId - Get products by store id throught GET
Future<List<Product>> getProductsByStoreId(int id) async {
  final _url = '$apiUrl/tienda/$id/productos';

  /* take token */
  String _token = await getToken();

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });
  List<Product> products;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    products = (_result['data'] as List)
        .map((e) => new Product.fromJson(e['producto']))
        .toList();
  }
  return products;
}

/// getSuscriptions - Get All suscriptions of login user to a store throught GET
Future<List<Store>> getSuscriptions() async {
  final _url = '$apiUrl/usuario/suscripciones';

  /* take token */
  String _token = await getToken();

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });
  List<Store> stores;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    stores = (_result['data'] as List)
        .map((e) => new Store.fromJson(e['tienda']))
        .toList();
  }

  return stores;
}
