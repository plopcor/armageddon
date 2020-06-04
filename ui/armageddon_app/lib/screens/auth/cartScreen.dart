import 'package:armageddon_app/constants.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Column(
        children: <Widget>[
          /* Titulo de Screen*/
          Padding(
            padding: const EdgeInsets.only(bottom: 35, top: 35),
            child: Container(
              height: 70,
              decoration: new BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Carrito ",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* FIN Titulo de Screen*/

          /* Lista de productos*/
          Container(
            height: 300,
            decoration: new BoxDecoration(
                color: Colors.grey[300],
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  topRight: const Radius.circular(30.0),
                  bottomLeft: const Radius.circular(30.0),
                  bottomRight: const Radius.circular(30.0),
                )),

            //Hay que meter lisado de productos con imagen / nombre / cantidad / precio
          ),
          /* FIN Lista de productos*/

          /* Precio final*/
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 70,
              decoration: new BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30.0),
                  )),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Precio final : ",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 175),
                    child: Text(
                      "XX€",
                      style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          /* FIN Precio final*/

          /*Boton pago*/
          Padding(
            padding: const EdgeInsets.only(top: 17),
            child: RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(horizontal: 115, vertical: 15),
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
          /* FIN Boton pago*/
        ],
      ),
    );
  }
}
