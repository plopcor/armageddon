import 'dart:async';
import 'dart:convert';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/cartModel.dart';
import 'package:armageddon_app/models/orderModel.dart';
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

/// payOrder - Post change state to pay throught POST
Future<Order> payOrder(Order order) async {
  var id = order.id;
  final _url = '$apiUrl/usuario/pedido/$id/pagar';

  /* take token */
  String _token = await getToken();

  final _response = await http.post(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });

  Order _orderN;

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);
    _orderN = Order.fromJson(_result['data']);
  }

  return _orderN;
}

/// editProfile - Put All profile changes throught Put
Future<bool> editProfile(String nombre, String email) async {
  final _url = '$apiUrl/usuario';

  /* take token */
  String _token = await getToken();

  Map data = {};

  if (email.isNotEmpty) {
    data.addAll({jsonEncode("email"): jsonEncode(nombre)});
  }

  if (nombre.isNotEmpty) {
    data.addAll({jsonEncode("nombre"): jsonEncode(nombre)});
  }

  final _response = await http.put(
    _url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    },
    body: data.toString(),
  );

  if (_response.statusCode == 200)
    return true;
  else
    return false;
}

/// addFavouriteOrder - Add a favourite order throught POST
Future<bool> addFavouriteOrder(Order order) async {
  var id = order.id;
  final _url = '$apiUrl/usuario/pedido/$id/favorito';

  /* take token */
  String _token = await getToken();

  final _response = await http.post(
    _url,
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    },
  );

  if (_response.statusCode == 200)
    return true;
  else
    return false;
}
