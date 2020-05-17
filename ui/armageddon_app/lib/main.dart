import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/registerScreen.dart';
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

class StartButton extends StatelessWidget {
  final String text;
  final bool type;
  final Widget page;

  StartButton({this.text, this.type, this.page});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ));
      },
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: type ? Colors.white : PrimaryPurple,
          ),
        ),
        margin: EdgeInsets.only(top: 24, left: 27, right: 27),
        padding: EdgeInsets.symmetric(horizontal: 105, vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: type ? PrimaryPurple : Colors.white,
        ),
      ),
    );
  }
}
