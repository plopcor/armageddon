import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:armageddon_app/services/dataPutService.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _textNameController = TextEditingController();
  final _textEmailController = TextEditingController();

  @override
  void dispose() {
    _textNameController.dispose();
    _textEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }
              return Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    margin: EdgeInsets.symmetric(horizontal: 27),
                    decoration: BoxDecoration(
                      color: PrimaryPurple,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'EDITAR PERFIL',
                          style: new TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        SizedBox(height: 24),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image(
                              fit: BoxFit.fitHeight,
                              height: 122,
                              width: 122,
                              image: NetworkImage(snapshot.data.avatar),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        InputText(
                          placeHolderText: 'Nombre',
                          hideText: false,
                          icon: Icons.home,
                          controller: _textNameController,
                        ),
                        InputText(
                          placeHolderText: 'Correo electrónico',
                          hideText: false,
                          icon: Icons.email,
                          controller: _textEmailController,
                          textInputType: TextInputType.emailAddress,
                        ),
                        StartButton(
                          text: 'Guardar',
                          type: false,
                          nombre: _textNameController.text,
                          email: _textEmailController.text,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: new CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  final String placeHolderText;
  final bool hideText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType textInputType;

  InputText(
      {this.placeHolderText,
      this.hideText,
      this.icon,
      this.controller,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    var grey = Colors.grey[400];
    return Padding(
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return 'Introduce ' +
                (placeHolderText.endsWith('a') ? 'una ' : 'un ') +
                placeHolderText;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: placeHolderText,
          contentPadding: EdgeInsets.all(18),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(17),
          ),
          hintStyle: TextStyle(color: grey),
          prefixIcon: Icon(
            icon,
          ),
        ),
        style: TextStyle(
          fontSize: 24,
          color: PrimaryPurple,
        ),
        obscureText: hideText,
      ),
      padding: EdgeInsets.only(top: 24, left: 27, right: 27),
    );
  }
}

class StartButton extends StatelessWidget {
  final String text, nombre, email;
  final bool type;
  StartButton({this.text, this.type, this.nombre, this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 27, right: 27),
      child: RaisedButton(
        onPressed: () {
          FutureBuilder(
            future: editProfile(nombre, email),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return Container();
            },
          );
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.symmetric(horizontal: 105, vertical: 18),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
          side: BorderSide(
            color: type ? PrimaryPurple : Colors.white,
          ),
        ),
        color: type ? PrimaryPurple : Colors.white,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 24,
            color: type ? Colors.white : PrimaryPurple,
          ),
        ),
      ),
    );
  }
}
