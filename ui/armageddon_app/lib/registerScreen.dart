import 'package:armageddon_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:armageddon_app/signInScreen.dart';
import 'package:armageddon_app/main.dart';

class RegisterScreen extends StatelessWidget {
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
              height: 50,
            ),
            InputText(
              placeHolderText: 'Usuario',
              hideText: false,
            ),
            InputText(
              placeHolderText: 'Correo electrónico',
              hideText: false,
            ),
            InputText(
              placeHolderText: 'Contraseña',
              hideText: true,
            ),
            InputText(
              placeHolderText: 'Confirmar Contraseña',
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
