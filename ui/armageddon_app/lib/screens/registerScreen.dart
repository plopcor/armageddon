import 'package:armageddon_app/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InputText(
            placeHolderText: 'Usuario',
            hideText: false,
            icon: Icons.home,
          ),
          InputText(
            placeHolderText: 'Correo electrónico',
            hideText: false,
            icon: Icons.email,
          ),
          InputText(
            placeHolderText: 'Contraseña',
            hideText: true,
            icon: Icons.lock,
          ),
          InputText(
            placeHolderText: 'Confirmar Contraseña',
            hideText: true,
            icon: Icons.lock,
          ),
          Container(
            margin: EdgeInsets.only(top: 24, left: 27, right: 27),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
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
