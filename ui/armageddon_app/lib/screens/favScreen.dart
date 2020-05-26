import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/customExpansionPanelList.dart';
import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        title: Text('Favoritos'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              }),
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Center(child: Text('Buscar')),
          ),
        ],
      ),
      body: MyStatefulWidget(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Tienda $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(8);
  final _itemListController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CustomExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
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
                    height: 150,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 130,
                          child: PageView(
                            controller: PageController(
                              initialPage: 0,
                            ),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              RowData(),
                              RowData(),
                            ],
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
                )
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
