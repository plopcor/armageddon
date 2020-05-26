import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(),
      body: FutureBuilder<List<Product>>(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Product product = snapshot.data[index];
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(product.nombre),
                          Image(
                            image: NetworkImage(product.imgPath),
                            height: 77,
                            width: 77,
                          ),
                        ],
                      ),
                    );
                  });
            } else
              return CircularProgressIndicator();
          }),
    );
  }
}
