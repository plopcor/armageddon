import 'package:armageddon_app/constants.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String text;
  final bool type;
  final String routeName;
  StartButton({this.text, this.type, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 27, right: 27),
      child: RaisedButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, routeName);
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
          style: TextStyle(
            fontSize: 24,
            color: type ? Colors.white : PrimaryPurple,
          ),
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
            //  color: focusNode.hasFocus ? PrimaryPurple : grey,
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
