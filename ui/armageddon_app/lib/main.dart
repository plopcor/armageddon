import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/registerScreen.dart';
import 'package:armageddon_app/signInScreen.dart';
import 'package:armageddon_app/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: StartScreen(),
      ),
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
                SizedBox(
                  height: 100,
                ),
                StartButton(
                  text: 'Iniciar Sesión',
                  type: true,
                  page: SignInScreen(),
                ),
                StartButton(
                  text: 'Crear Cuenta',
                  type: false,
                  page: RegisterScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
