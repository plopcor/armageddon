import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/signInScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(home: StartScreen()),
    );

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 150),
              child: Text(
                'Listo para comprar tiempo',
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: PrimaryPurple,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ));
                  },
                  child: Container(
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 24,
                        color: PrimaryPurple,
                      ),
                    ),
                    margin: EdgeInsets.only(top: 150, left: 27, right: 27),
                    padding:
                        EdgeInsets.symmetric(horizontal: 105, vertical: 18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Crear Cuenta',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  margin: EdgeInsets.only(top: 24, left: 27, right: 27),
                  padding: EdgeInsets.symmetric(horizontal: 105, vertical: 18),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: PrimaryPurple,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
