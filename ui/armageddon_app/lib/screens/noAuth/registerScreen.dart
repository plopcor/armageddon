import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/root_screen.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:armageddon_app/widgets.dart';
import 'package:flutter/material.dart';

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
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _textNameController = TextEditingController();
  final _textUserController = TextEditingController();
  final _textPassController = TextEditingController();
  final _textEmailController = TextEditingController();

  @override
  void dispose() {
    _textNameController.dispose();
    _textUserController.dispose();
    _textPassController.dispose();
    _textEmailController.dispose();
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
            placeHolderText: 'Nombre',
            hideText: false,
            icon: Icons.home,
            controller: _textNameController,
          ),
          InputText(
            placeHolderText: 'Usuario',
            hideText: false,
            icon: Icons.home,
            controller: _textUserController,
          ),
          InputText(
            placeHolderText: 'Correo electrónico',
            hideText: false,
            icon: Icons.email,
            controller: _textEmailController,
            textInputType: TextInputType.emailAddress,
          ),
          InputText(
            placeHolderText: 'Contraseña',
            hideText: true,
            icon: Icons.lock,
            controller: _textPassController,
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 27, right: 27),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  var _name = _textNameController.text;
                  var _user = _textUserController.text;
                  var _email = _textEmailController.text;
                  var _pass = _textPassController.text;

                  register(
                          name: _name,
                          username: _user,
                          password: _pass,
                          email: _email)
                      .then((response) {
                    if (response)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RootScreen()),
                      );
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
                'Crear Cuenta',
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
