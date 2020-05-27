import 'dart:developer';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:armageddon_app/widgets.dart';
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
            SingInForm(),
            RaisedButton(
              onPressed: () {
                logout().then((value) => log(value.toString()));
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

class SingInForm extends StatefulWidget {
  @override
  SingInFormState createState() {
    return SingInFormState();
  }
}

class SingInFormState extends State<SingInForm> {
  final _formKey = GlobalKey<FormState>();
  final _textUserController = TextEditingController();
  final _textPassController = TextEditingController();

  @override
  void dispose() {
    _textUserController.dispose();
    _textPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InputText(
            icon: Icons.home,
            hideText: false,
            placeHolderText: 'Usuario',
            controller: _textUserController,
          ),
          InputText(
            icon: Icons.lock,
            hideText: true,
            placeHolderText: 'Contraseña',
            controller: _textPassController,
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 27, right: 27),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  var _user = _textUserController.text;
                  var _pass = _textPassController.text;

                  login(username: _user, password: _pass).then((response) {
                    if (response) Navigator.pushReplacementNamed(context, '/suscription');
                  });
                }
              },
              padding: EdgeInsets.symmetric(horizontal: 105, vertical: 18),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
                side: BorderSide(
                  color: PrimaryPurple,
                ),
              ),
              color: PrimaryPurple,
              child: Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
