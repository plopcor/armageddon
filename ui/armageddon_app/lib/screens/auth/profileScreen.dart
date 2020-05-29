import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/root_screen.dart';
import 'package:armageddon_app/screens/auth/favScreen.dart';
import 'package:armageddon_app/services/authenticationServices.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
            }
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  'PERFIL',
                  style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
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
                Text(
                  snapshot.data.nombre,
                  style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ProfileButton(
                      text: 'Historial Pedidos',
                      type: true,
                      routeName: '/favProducts',
                    ),
                    ProfileButton(
                      text: 'Editar Perfil',
                      type: true,
                      routeName: '',
                    ),
                    ProfileButton(text: 'Cerrar Sesión', type: false),
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child: new CircularProgressIndicator(),
            );
          }
        });
  }
}

class ProfileButton extends StatelessWidget {
  final String text;
  final bool type;
  final String routeName;
  ProfileButton({this.text, this.type, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24, left: 27, right: 27),
      child: RaisedButton(
        onPressed: () {
          if (type == true) {
            if (routeName.contains('/favProducts'))
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    backgroundColor: BackgroundColor,
                    appBar: AppBar(),
                    body: new FavScreen(),
                  ),
                ),
              );
            else
              Navigator.popAndPushNamed(context, routeName);
          } else {
            logout().whenComplete(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RootScreen()),
              );
            });
          }
        },
        padding: EdgeInsets.all(20),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
          side: BorderSide(
            color: Colors.white,
          ),
        ),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Icon(type == true ? Icons.keyboard_arrow_right : Icons.exit_to_app)
          ],
        ),
      ),
    );
  }
}
