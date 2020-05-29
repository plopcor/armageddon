import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/screens/auth/profileScreen.dart';
import 'package:armageddon_app/screens/auth/searchScreen.dart';
import 'package:armageddon_app/screens/auth/favScreen.dart';
import 'package:armageddon_app/screens/noAuth/startScreen.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(context) {
    return FutureBuilder<bool>(
        future: isAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data)
                return new MyAuthApp();
              else
                return new StartScreen();
            } else {
              return Text('Token error');
            }
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}

class MyAuthApp extends StatefulWidget {
  @override
  _MyAuthAppState createState() => _MyAuthAppState();
}

class _MyAuthAppState extends State<MyAuthApp> {
  var _actualScreen = 0;

  var _pageOptions = [
    FavScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: _pageOptions[_actualScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _actualScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favoritos'),
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
    );
  }
}
