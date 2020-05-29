import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatelessWidget {
  final List<Product> productos;
  ListProducts({this.productos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
