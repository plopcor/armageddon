import 'dart:async';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/responseModel.dart';
import 'package:http/http.dart' as http;

Future<Response> login({String password, String username}) async {
  final response =
      await http.post('$apiUrl/login?usuario=$username&contraseña=$password');
  return responseFromJson(response.body);
}
