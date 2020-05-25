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
  String token;
  if (response.statusCode == 200) {
    Map<String, dynamic> result = jsonDecode(response.body);
    result = result['data'];
    user = User.fromJson(result['usuario']);
    token = result['token'].toString();
    log(user.toString());
  } else {
    user = null;
  }

  return user;
}
