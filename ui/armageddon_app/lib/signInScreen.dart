import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/main.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'ARMAGEDDON',
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 39,
                  color: PrimaryPurple,
                  letterSpacing: 4,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 49, vertical: 100),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                InputText(
                  placeHolderText: 'Usuario',
                ),
                InputText(
                  placeHolderText: 'Contraseña',
                ),
                StartButton(
                  text: 'Iniciar Sesión',
                  type: true,
                  page: null,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String placeHolderText;

  InputText({this.placeHolderText});

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
      ),
      margin: EdgeInsets.only(top: 24, left: 27, right: 27),
      padding: EdgeInsets.all(18),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
    );
  }
}
