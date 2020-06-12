import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/orderModel.dart';
import 'package:armageddon_app/screens/auth/ListProducts.dart';
import 'package:armageddon_app/screens/auth/qrScreen.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Order>>(
        future: getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
            }

            return MyOrderList(snapshot.data);
          } else
            return Center(child: CircularProgressIndicator());
        });
  }
}

class MyOrderList extends StatefulWidget {
  final List<Order> data;

  MyOrderList(this.data);

  @override
  _MyOrderListState createState() => _MyOrderListState();
}

class _MyOrderListState extends State<MyOrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              iconSize: 40,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.data.length,
                itemBuilder: (context, index) {
                  Order order = widget.data[index];
                  int orderLength = order.productos.length;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListProducts(
                            order: order,
                          ),
                        ),
                      );
                    },
                    onLongPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRScreen(order: order),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 27, left: 24, right: 24),
                      padding: EdgeInsets.only(
                          left: 10, top: 24, right: 0, bottom: 8),
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
                                width: 280,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: orderLength,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (index < 3) {
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
                                      } else {
                                        return Container();
                                      }
                                    }),
                              ),
                              buildContainer(orderLength),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 14),
                            child: Text(
                              '$orderLength Productos',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Container buildContainer(int lenght) {
    if (lenght > 3)
      return Container(
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
      );
    else
      return Container();
  }
}
