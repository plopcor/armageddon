import 'dart:async';
import 'dart:convert';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:http/http.dart' as http;

/// crearPedido - Post All list products throught POST
Future<void> crearPedido(int idTienda, List<Product> productos) async {
  final _url = '$apiUrl/tienda/{$idTienda}/pedido';

  /* take token */
  String _token = await getToken();

/* prepare json data */

  Map<String, dynamic> data() => {
        "productos": List<dynamic>.from(
          productos.map(
            (x) => x.toJson(),
          ),
        ),
      };

  final _response = await http.post(
    _url,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    },
    body: data(),
  );

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);
    print(_result);
  }
}
