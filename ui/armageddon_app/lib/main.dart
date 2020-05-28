import 'dart:developer';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/userModel.dart';
import 'package:armageddon_app/root_screen.dart';
import 'package:armageddon_app/screens/auth/profileScreen.dart';
import 'package:armageddon_app/screens/auth/searchScreen.dart';
import 'package:armageddon_app/screens/auth/suscriptionsScreen.dart';
import 'package:armageddon_app/screens/noAuth/registerScreen.dart';
import 'package:armageddon_app/screens/noAuth/signInScreen.dart';
import 'package:armageddon_app/screens/noAuth/startScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  /* Inicializar Hive */
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  '/welcome': (BuildContext context) => new StartScreen(),
  '/signIn': (BuildContext context) => new SignInScreen(),
  '/register': (BuildContext context) => new RegisterScreen(),
  '/suscription': (BuildContext context) => new SuscriptionScreen(),
  '/search': (BuildContext context) => new SearchScreen(),
  '/profile': (BuildContext context) => new ProfileScreen(),
};
/* Creamos el tema de la app (colores, fuentes, etc..) */
ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.red,
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.yellow, fontSize: 24.0),
    ),
  );
}

Future<void> initHive() async {
  final _dir = await getApplicationDocumentsDirectory();
  Hive.init(_dir.path);
  Hive.registerAdapter(UserAdapter());
}

/// Creamos el contenido de la app con el menu inferior
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PrimaryPurple,
        hintColor: Colors.white,
        backgroundColor: BackgroundColor
      ),
      routes: routes,
      home: RootScreen(),
    );
  }
}
