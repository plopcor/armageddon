import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/models/storeModel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getProducts() async {
  final _url = '$apiUrl/productos';

  final _response = await http.get(_url);
  List<Product> products;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    products =
        (_result['data'] as List).map((e) => new Product.fromJson(e)).toList();
  }

  log(products.toString());

  return products;
}

Future<List<Store>> getStores() async {
  final _url = '$apiUrl/tiendas';

  /* take token */
  var _tokenBox = await Hive.openBox<String>('token');
  String _token = _tokenBox.get(0);

  log(_tokenBox.get(0));

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });
  List<Store> stores;

  log(jsonDecode(_response.body).toString());

  _tokenBox.close();

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    stores = (_result['data'] as List)
        .map((e) => new Store.fromJson(e['tienda']))
        .toList();
  }

  log(stores.toString());

  return stores;
}

Future<List<Store>> getSuscriptions() async {
  final _url = '$apiUrl/usuario/suscripciones';

  /* take token */
  var _tokenBox = await Hive.openBox<String>('token');
  String _token = _tokenBox.get(0);

  log(_tokenBox.get(0));

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });
  List<Store> stores;

  log(jsonDecode(_response.body).toString());

  _tokenBox.close();

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);

    stores = (_result['data'] as List)
        .map((e) => new Store.fromJson(e['tienda']))
        .toList();
  }

  log(stores.toString());

  return stores;
}
