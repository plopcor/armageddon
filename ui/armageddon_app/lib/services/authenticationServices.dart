import 'dart:async';
import 'dart:convert';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/userModel.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

/// Login - Send username and password throught POST
Future<bool> login({String password, String username}) async {
  final _url = '$apiUrl/login';

  final _response = await http
      .post(_url, body: {'usuario': username, 'contraseña': password});

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);
    _result = _result['data'];

    User _user = User.fromJson(_result['usuario']);

    print(_user.esTienda.toString());

    /* save user object */
    await saveUser(_user);

    /* get token from _result*/
    String _token = _result['token'].toString();

    /* save token */
    await saveToken(_token);

    return true;
  } else {
    return false;
  }
}

/// Logout - Send token throught GET
Future<bool> logout() async {
  final _url = '$apiUrl/logout';

  /* take token */
  String _token = await getToken();

  final _response = await http.get(_url, headers: {
    'Accept': 'application/json',
    'Authorization': 'Bearer $_token',
  });

  if (_response.statusCode == 200)
    return true;
  else
    return false;
}

/// Register - Send new user data throught POST
Future<bool> register(
    {String password, String username, String name, String email}) async {
  final _url = '$apiUrl/register';

  final _response = await http.post(_url, body: {
    'nombre': name,
    'usuario': username,
    'contraseña': password,
    'email': email
  });

  if (_response.statusCode == 200) {
    Map<String, dynamic> _result = jsonDecode(_response.body);
    _result = _result['data'];

    User _user = User.fromJson(_result['usuario']);

    /* save user object */
    await saveUser(_user);

    /* get token from _result*/
    String _token = _result['token'].toString();

    /* save token */
    await saveToken(_token);

    return true;
  } else {
    return false;
  }
}

/// isAuth - return true if token is ok
Future<bool> isAuth() async {
  final _url = '$apiUrl/token';
  var _token;
  bool verification = false;

  _token = await getToken();

  if (_token != null) {
    final _response = await http.get(_url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    });

    if (_response.statusCode == 200) {
      verification =
          jsonDecode(_response.body).toString().contains('true') ? true : false;
    }
  }
  return verification;
}

Future<User> getUser() async {
  var _userBox = await Hive.openBox<User>('user');
  User _user;

  if (_userBox.containsKey(0))
    _user = _userBox.get(0);
  else
    _user = null;

  return _user;
}

Future<bool> saveUser(User _user) async {
  if (_user != null) {
    var _userBox = await Hive.openBox<User>('user');

    if (_userBox.containsKey(0))
      _userBox.putAt(0, _user);
    else
      _userBox.add(_user);
    return true;
  } else
    return false;
}

Future<bool> saveToken(_token) async {
  if (_token.toString().isNotEmpty) {
    var _tokenBox = await Hive.openBox<String>('token');

    if (_tokenBox.containsKey(0))
      _tokenBox.putAt(0, _token);
    else
      _tokenBox.add(_token);
    return true;
  } else
    return false;
}

Future<String> getToken() async {
  var _tokenBox = await Hive.openBox<String>('token');
  String _token;
  if (_tokenBox.containsKey(0)) _token = _tokenBox.get(0);
  return _token;
}
