import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

/// Login - Send username and password throught POST
Future<User> login({String password, String username}) async {
  final url = '$apiUrl/login';

  final response = await http
      .post(url, body: {'usuario': '$username', 'contraseña': '$password'});

  User user;
  if (response.statusCode == 200) {
    Map<String, dynamic> result = jsonDecode(response.body);
    result = result['data'];

    user = User.fromJson(result['usuario']);

    String token = result['token'].toString();
    _setToken(token);
  }

  return user;
}

/// Logout - Send token throught GET
Future<bool> logout() async {
  final url = '$apiUrl/logout';

  final token = await _getToken();

  final response = await http.get(url,
      headers: {'Accept': 'application/json', 'Authorization': "$token"});

  log(jsonDecode(response.body).toString());

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

/// Returns the token from Shared Preferences
Future<String> _getToken() async {
  final SharedPreferences prefs = await _prefs;

  return prefs.getString('token') ?? 'NO TOKEN';
}

/// Saves the token in Shared Preferences
Future<bool> _setToken(String token) async {
  final SharedPreferences prefs = await _prefs;

  return prefs.setString('token', token);
}
