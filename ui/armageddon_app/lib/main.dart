import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/userModel.dart';
import 'package:armageddon_app/screens/profileScreen.dart';
import 'package:armageddon_app/screens/registerScreen.dart';
import 'package:armageddon_app/screens/searchScreen.dart';
import 'package:armageddon_app/screens/signInScreen.dart';
import 'package:armageddon_app/screens/startScreen.dart';
import 'package:armageddon_app/screens/suscriptionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  /* inizialice Hive */
  WidgetsFlutterBinding.ensureInitialized();
  initHive();

  return runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  '/welcome': (BuildContext context) => new StartScreen(),
  '/signIn': (BuildContext context) => new SignInScreen(),
  '/register': (BuildContext context) => new RegisterScreen(),
  '/suscription': (BuildContext context) => new SuscriptionScreen(),
  '/search': (BuildContext context) => new SearchScreen(),
  '/profile': (BuildContext context) => new ProfileScreen(),
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

Future<void> initHive() async {
  final _dir = await getApplicationDocumentsDirectory();
  Hive.init(_dir.path);
  Hive.registerAdapter(UserAdapter());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _actualScreen = 0;

  var _pageOptions = [
    SuscriptionScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PrimaryPurple,
        hintColor: Colors.white,
      ),
      routes: routes,
      home: Scaffold(
        body: _pageOptions[_actualScreen],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _actualScreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions),
                title: Text('Suscripciones'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Buscar'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                title: Text('Perfil'),
                backgroundColor: Colors.white)
          ],
          onTap: (index) {
            setState(() {
              _actualScreen = index;
            });
          },
        ),
      ),
    );
  }
}
