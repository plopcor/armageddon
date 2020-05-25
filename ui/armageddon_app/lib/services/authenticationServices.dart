import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/userModel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

/// Login - Send username and password throught POST
Future<bool> login({String password, String username}) async {
  final _url = '$apiUrl/login';

  final _response = await http
      .post(_url, body: {'usuario': '$username', 'contraseña': '$password'});

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);
    _result = _result['data'];

    User _user = User.fromJson(_result['usuario']);

    /* save user object */
    var _userBox = await Hive.openBox<User>('user');
    _userBox.add(_user);

    String token = _result['token'].toString();

    /* save token */
    var _tokenBox = await Hive.openBox<String>('token');
    _tokenBox.putAt(0, token);

    log(_tokenBox.get(0));

    return true;
  } else {
    return false;
  }
}

/// Logout - Send token throught GET
Future<bool> logout() async {
  final _url = '$apiUrl/logout';

  /* take token */
  var _tokenBox = await Hive.openBox<String>('token');
  String _token = _tokenBox.get(0);

  log(_tokenBox.get(0));

  final _response = await http.get(_url,
      headers: {'Accept': 'application/json', 'Authorization': "$_token"});

  log(jsonDecode(_response.body).toString());

  if (_response.statusCode == 200)
    return true;
  else
    return false;
}
