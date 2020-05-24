import 'dart:async';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/responseModel.dart';
import 'package:http/http.dart' as http;

Future<Response> login({String password, String username}) async {
  final url = '$apiUrl/login';

  final response = await http
      .post(url, body: {'usuario': '$username', 'contraseña': '$password'});

  if (response.statusCode == 200)
    return responseFromJson(response.body);
  else
    return responseFromJson('{"success": false}');
}
