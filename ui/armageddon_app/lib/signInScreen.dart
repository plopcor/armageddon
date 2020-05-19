import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/main.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text(
              'ARMAGEDDON',
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 39,
                color: PrimaryPurple,
                letterSpacing: 4,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            InputText(
              placeHolderText: 'Usuario',
              hideText: false,
            ),
            InputText(
              placeHolderText: 'Contraseña',
              hideText: true,
            ),
            StartButton(
              text: 'Iniciar Sesión',
              type: true,
              page: null,
            )
          ],
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String placeHolderText;
  final bool hideText;

  InputText({this.placeHolderText, this.hideText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: placeHolderText,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey[400]),
        ),
        style: TextStyle(
          fontSize: 24,
          color: PrimaryPurple,
        ),
        obscureText: hideText,
      ),
      margin: EdgeInsets.only(top: 24, left: 27, right: 27),
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 18, right: 18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
    );
  }
}
