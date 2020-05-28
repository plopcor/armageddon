import 'dart:developer';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BackgroundColor,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions),
                title: Text('Suscripciones'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Buscar'),
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.people),
                title: Text('Perfil'),
                backgroundColor: Colors.white)
          ],
          onTap: (index) {
            Navigator.pushNamed(context, "/home");
          },
        ),
        body: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            //Fondo
            new Container(
              width: 450,
              height: 630,
              color: Colors.white,
            ),

            //Container rojo (imagen)
            new Container(
              width: 450,
              height: 225.0,
              color: Colors.redAccent,
            ),
            //Container Lila (Orid)

            Positioned(
              top: 180,
              bottom: 0,
              left: 20,
              right: 20,
              child: new Container(
                  height: 100,
                  decoration: new BoxDecoration(
                      color: PrimaryPurple,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                  child: new Column(
                    children: <Widget>[
                      //Productos
                      Padding(
                        padding: const EdgeInsets.only(top: 70, right: 202),
                        child: Text(
                          "Productos",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //lista productos
                      FutureBuilder<List<Product>>(
                          future: getProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text("Error");
                              }

                              return Expanded(
                                child: Container(
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        Product product = snapshot.data[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                log("Se ha clidao el broducto con id ---> " +
                                                    product.id.toString());

                                                //Add al carrito
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17)),
                                                child: Image.network(
                                                  product.imgPath,
                                                  height: 90,
                                                  width: 90,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              );
                            } else
                              return Center(child: CircularProgressIndicator());
                          }),
                    ],
                  )),
            ),

            //Contaner blanco (info)

            Positioned(
              top: 80,
              left: 45,
              right: 45,
              child: Container(
                  height: 160,
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                        bottomLeft: const Radius.circular(30.0),
                        bottomRight: const Radius.circular(30.0),
                      )),
                  child: new Column(
                    children: <Widget>[
                      //Indormacion tienda
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 90),
                        child: Text(
                          "Nombre de la tienda",
                          style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 185),
                        child: Text(
                          "Datos tienda",
                          style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 215),
                        child: Text(
                          "Numero",
                          style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15, right: 215),
                        child: Text(
                          "Numero",
                          style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //FIN INFO TIENDA
                    ],
                  )),
            ),
            Positioned(
              top: 43,
              left: 315,
              right: 20,
              child: Container(
                  height: 80,
                  decoration: new BoxDecoration(
                      color: PrimaryPurple,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                        bottomLeft: const Radius.circular(30.0),
                        bottomRight: const Radius.circular(30.0),
                      )),
                  child: new Column(
                    children: <Widget>[
                      //Indormacion tienda
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.black,
                          size: 55.0,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        )
        // Text("Dima"),
        );
  }
}
