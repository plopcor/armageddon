import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/screens/registerScreen.dart';
import 'package:armageddon_app/screens/signInScreen.dart';
import 'package:armageddon_app/screens/startScreen.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: PrimaryPurple,
      hintColor: Colors.white,
    ),
    home: StartScreen(),
    routes: routes,
  ));
}

var routes = <String, WidgetBuilder>{
  '/welcome': (BuildContext context) => new StartScreen(),
  '/signIn': (BuildContext context) => new SignInScreen(),
  '/register': (BuildContext context) => new RegisterScreen(),
  // '/home': (BuildContext context) => new HomeScreen(),
  // '/search': (BuildContext context) => new SearchScreen(),
  // '/profile': (BuildContext context) => new ProfileScreen(),
};

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.red,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0),
    ),
  );
}
