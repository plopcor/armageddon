import 'package:armageddon_app/constants.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: ShoppingBasket(),
      ),
    );
  }
}

class ShoppingBasket extends StatefulWidget {
  @override
  ShoppingBasketState createState() => new ShoppingBasketState();
}

class MyItem {
  MyItem({this.isExpanded: false, this.header, this.body});

  bool isExpanded;
  final String header;
  final String body;
}

class ShoppingBasketState extends State<ShoppingBasket> {
  List<MyItem> _items = <MyItem>[
    new MyItem(header: 'tienda', body: 'productos'),
    new MyItem(header: 'pene', body: 'productos'),
    new MyItem(header: 'pene2', body: 'productos')
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: [
        new ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _items[index].isExpanded = !_items[index].isExpanded;
            });
          },
          children: _items.map((MyItem item) {
            return new ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return new Text(item.header);
              },
              isExpanded: item.isExpanded,
              body: new Container(
                color: PrimaryPurple,
                child: new Text("productos"),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
