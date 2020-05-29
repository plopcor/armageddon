import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/orderModel.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
        future: getFavOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
            }

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Order order = snapshot.data[index];
                  return Container(
                    margin: EdgeInsets.only(top: 27, left: 24, right: 24),
                    padding:
                        EdgeInsets.only(left: 10, top: 24, right: 0, bottom: 8),
                    decoration: BoxDecoration(
                        color: PrimaryPurple,
                        borderRadius: BorderRadius.circular(17)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 77,
                              width: 260,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: order.productos.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      padding: EdgeInsets.all(1),
                                      margin: EdgeInsets.only(left: 14),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(17)),
                                      child: Image.network(
                                        order.productos[index].imgPath,
                                        height: 77,
                                        width: 77,
                                      ),
                                    );
                                  }),
                            ),
                            Container(
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey[400],
                              ),
                              height: 70,
                              width: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(17),
                                  bottomLeft: Radius.circular(17),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Text(
                            'Mañanas',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Text(
                            '3 Productos',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}
