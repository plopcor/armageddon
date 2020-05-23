import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<User> getPost() async {
  final response = await http.get('$apiUrl/1');
  return userFromJson(response.body);
}
