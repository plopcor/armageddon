import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/customExpansionPanelList.dart';
import 'package:armageddon_app/models/storeModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

// TODO: add dot indicator

class SuscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

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

  void test() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    List<Widget> pedidos = [RowData(), RowData()];
    return Padding(
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
                          child: ScrollingPageIndicator(
                            dotColor: Colors.grey[400],
                            dotSelectedColor: Colors.white,
                            dotSize: 12,
                            dotSelectedSize: 13,
                            dotSpacing: 20,
                            controller: _paginationController,
                            itemCount: pedidos.length,
                            orientation: Axis.horizontal,
                          ),
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

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return null;
  }
}
