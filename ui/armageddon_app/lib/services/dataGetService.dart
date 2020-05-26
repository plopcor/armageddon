import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
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
