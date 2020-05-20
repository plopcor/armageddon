import 'package:armageddon_app/constants.dart';
import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String text;
  final bool type;
  final Widget page;
  StartButton({this.text, this.type, this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 27, right: 27),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return page;
              },
            ),
          );
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
  InputText({this.placeHolderText, this.hideText, this.icon});

  @override
  Widget build(BuildContext context) {
    var grey = Colors.grey[400];
    return Container(
      child: TextFormField(
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
          border: InputBorder.none,
          hintStyle: TextStyle(color: grey),
          prefixIcon: Icon(
            icon,
            color: grey,
          ),
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
