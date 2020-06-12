import 'package:armageddon_app/models/storeModel.dart';
import 'package:armageddon_app/screens/customExpansionPanel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class FavScreen extends StatelessWidget {
  get index => 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
        title: Text('Preuebas'),
      ),*/
        body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 25,
            right: 200,
          ),
          child: Text(
            'Subscripciones',
            overflow: TextOverflow.visible,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: PrimaryPurple,
              letterSpacing: 1,
            ),
          ),
        ),
        _buildCarousel(context, index),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            right: 270,
          ),
          child: Text(
            'Rutinas',
            overflow: TextOverflow.visible,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: PrimaryPurple,
              letterSpacing: 1,
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            FutureBuilder<List<Store>>(
              future: getSuscriptions(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  }

                  stores = snapshot.data;

                  return MyStatefulWidget(data: snapshot.data);
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              },
            ),
          ],
        ),
      ],
    ));
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
            height: 280,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (BuildContext context, int itemIndex) {
                return _buildCarouselItem(context, carouselIndex, itemIndex);
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: PrimaryPurple,
          borderRadius: BorderRadius.all(Radius.circular(17.0)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),

              //ES LA IMAGEN
              child: Container(
                height: 180,
                width: 245,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://imgmedia.lbb.in/media/2018/08/5b898c57fe22575b86710050_1535741015631.jpg",
                        scale: 0.2),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                //BOTON
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 50,
                        //margin: EdgeInsets.only(top: 24, left: 27, right: 27),
                        child: RaisedButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                            side: BorderSide(
                              color: PrimaryPurple,
                            ),
                          ),
                          color: Colors.white,
                          child: Text(
                            'Ir a tienda',
                            style: TextStyle(
                              fontSize: 10,
                              color: PrimaryPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //FIN BOTON

                //BOTON
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 50,
                        //margin: EdgeInsets.only(top: 24, left: 27, right: 27),
                        child: RaisedButton(
                          onPressed: null,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 18),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                            side: BorderSide(
                              color: PrimaryPurple,
                            ),
                          ),
                          color: Colors.white,
                          child: Text(
                            'Chat',
                            style: TextStyle(
                              fontSize: 10,
                              color: PrimaryPurple,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //FIN BOTON
              ],
            )
          ],
        ),
      ),
    );
  }
}

//EXPANSIBLE

// stores ExpansionPanel state information
class Item {
  Item({
    this.headerValue,
    this.isExpanded: false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Store> stores;

List<Store> getUltimateData() {
  return stores;
}

List<Item> generateItems(List<Store> stores) {
  return List.generate(stores.length, (int index) {
    return Item(
      headerValue: stores[index].nombre,
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  final List<Store> data;
  MyStatefulWidget({Key key, this.data}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState(data);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Store> stores;

  _MyStatefulWidgetState(this.stores);

  PageController _paginationController = PageController(initialPage: 0);
  List<Item> _data = generateItems(getUltimateData());
  List<Widget> pedidos = [RowData(), RowData()];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: CustomExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _data[index].isExpanded = !_data[index].isExpanded;
              });
            },
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      item.headerValue,
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
                body: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(17),
                          bottomLeft: Radius.circular(17),
                        ),
                        color: PrimaryPurple,
                      ),
                      child: Container(
                        height: 200,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 160,
                              child: PageView(
                                controller: _paginationController,
                                scrollDirection: Axis.horizontal,
                                children: pedidos,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text('Dots'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(17),
                            bottomLeft: Radius.circular(17),
                          ),
                          color: Color(0xffFAFAFA)),
                    ),
                  ],
                ),
                isExpanded: item.isExpanded,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class RowData extends StatelessWidget {
  const RowData({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 17),
              StoreFavButton(),
              SizedBox(height: 17),
              StoreFavButton(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 17),
              StoreFavButton(),
              SizedBox(height: 17),
              StoreFavButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class StoreFavButton extends StatelessWidget {
  const StoreFavButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () {},
        padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
          side: BorderSide(
            color: Colors.white,
          ),
        ),
        color: Colors.white,
        child: Text(
          'Pedido n',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
