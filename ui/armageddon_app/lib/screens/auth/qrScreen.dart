import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/orderModel.dart';
import 'package:armageddon_app/models/storeModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:armageddon_app/services/dataPutService.dart';
import 'package:flutter/material.dart';

class QRScreen extends StatefulWidget {
  final Order order;
  const QRScreen({Key key, this.order}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.order.estado == 'PAGADO')
      return Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            gradient: LinearGradient(
              colors: [
                Color(0xFF5FFBF1),
                Color(0xFF4D84B6),
                Color(0xFFD16BA5),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: 51,
                height: 51,
                margin: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.white),
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.fitHeight,
                    height: 200,
                    width: 200,
                    image: NetworkImage(qrUrl + widget.order.codigoQr),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 27),
                  child: FutureBuilder(
                    future: getStoreById(widget.order.idTienda),
                    builder:
                        (BuildContext context, AsyncSnapshot<Store> snapshot) {
                      var store = snapshot.data;
                      return Container(
                        width: 200,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(store.nombre, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Latitud: ' + store.latitud),
                            Text('Longitud: ' + store.longitud)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    else
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 60),
          child: RaisedButton(
            onPressed: () {
              FutureBuilder(
                future: payOrder(widget.order),
                builder: (BuildContext context, AsyncSnapshot<Order> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) return Text("Error");
                    return Container();
                  } else {
                    return Center(
                      child: new CircularProgressIndicator(),
                    );
                  }
                },
              );
              Navigator.of(context).pop();
            },
            padding: EdgeInsets.all(20),
            elevation: 12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            color: PrimaryPurple,
            child: Text(
              'Pagar',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      );
  }
}
