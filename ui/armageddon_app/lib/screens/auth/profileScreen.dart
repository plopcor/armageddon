import 'dart:developer';

import 'package:armageddon_app/constants.dart';
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
            return Padding(
              padding: const EdgeInsets.only(right: 15, left: 15),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image(
                          fit: BoxFit.fitHeight,
                          height: 120,
                          image: NetworkImage(
                              "https://www.fundacion-affinity.org/sites/default/files/el-gato-necesita-tener-acceso-al-exterior.jpg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          snapshot.data.nombre,
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /*pedios*/
                        Container(
                          height: 60,
                          width: 60,
                          child: Image(image: AssetImage('images/negocio.png')),
                        ),
                        /*favoritos*/
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            height: 60,
                            width: 60,
                            child: Image(image: AssetImage('images/fav.png')),
                            //color: Colors.lightBlue,
                          ),
                        ),
                        /*seguidos*/
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            height: 60,
                            width: 60,
                            child: Image(image: AssetImage('images/man.png')),
                            //color: Colors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*NUM iconos*/
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /*pedios*/
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 60, left: 10),
                            child: Text(
                              "20",
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        /*favoritos*/
                        Padding(
                            padding: const EdgeInsets.only(right: 75, left: 25),
                            child: Text(
                              "20",
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        /*seguidos*/
                        Padding(
                            padding: const EdgeInsets.only(right: 10, left: 13),
                            child: Text(
                              "20",
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),
                  /*Nombres iconos*/
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /*pedios*/
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Pedidos",
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        /*favoritos*/
                        Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Text(
                              "Favoritos",
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        /*seguidos*/
                        Padding(
                            padding: const EdgeInsets.only(left: 27),
                            child: Text(
                              "Seguidos",
                              style: new TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ),
                  ),

                  /*Boton historial pedidos */
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: RaisedButton(
                            onPressed: () {},
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 10),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                              side: BorderSide(
                                color: PrimaryPurple,
                              ),
                            ),
                            color: PrimaryPurple,
                            child: Text(
                              'Historial pedidos',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*Boton historial pedidos */
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: RaisedButton(
                            onPressed: () {},
                            padding: EdgeInsets.symmetric(
                                horizontal: 105, vertical: 10),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                              side: BorderSide(
                                color: PrimaryPurple,
                              ),
                            ),
                            color: PrimaryPurple,
                            child: Text(
                              'Editar Perdil',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: RaisedButton(
                            onPressed: () {
                              logout().then((value) => log(value.toString()));
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                              side: BorderSide(
                                color: Colors.grey[300],
                              ),
                            ),
                            color: Colors.grey,
                            child: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: new CircularProgressIndicator(),
            );
          }
        });
  }
}
