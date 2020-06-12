import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/orderModel.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/services/dataPutService.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  final Order order;
  ListProducts({this.order});

  @override
  Widget build(BuildContext context) {
    List<Product> productos = order.productos;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                addFavouriteOrder(order);
              })
        ],
      ),
      backgroundColor: BackgroundColor,
      body: ListView.builder(
          itemCount: productos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(1),
              margin: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Image.network(
                productos[index].imgPath,
                height: 100,
                width: 100,
              ),
            );
          }),
    );
  }
}
