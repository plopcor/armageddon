import 'dart:async';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/cartModel.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:http/http.dart' as http;

/// crearPedido - Post All list products throught POST
Future<bool> crearPedido(int idTienda, Cart cart) async {
  final _url = '$apiUrl/tienda/$idTienda/pedido';

  /* take token */
  String _token = await getToken();

/* prepare json data */

  Map<String, dynamic> data = cart.toJson();

  final _response = await http.post(
    _url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    },
    body: data.toString(),
  );

  print(_response.statusCode.toString());

  if (_response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
