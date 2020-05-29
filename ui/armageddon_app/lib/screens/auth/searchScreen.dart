import 'dart:developer';

import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/models/storeModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MySearch();
  }
}

class MySearch extends StatefulWidget {
  @override
  _MySearchState createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final SearchBarController<Product> _searchBarProductController =
      SearchBarController();
  final SearchBarController<Store> _searchBarStoreController =
      SearchBarController();

  var _actualSearch = 0;
  var _searchOptions = ['PRODUCTOS', 'TIENDAS'];

  Future<List<Product>> productos = getProducts();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Scaffold(
        backgroundColor: BackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'BUSCAR',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    _searchOptions[_actualSearch],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _actualSearch = _actualSearch == 0 ? 1 : 0;
                      });
                    },
                    child: Text(
                      _searchOptions[_actualSearch == 0 ? 1 : 0],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
              Bar(
                searchBarProductController: _searchBarProductController,
                searchBarStoreController: _searchBarStoreController,
                actualSearch: _actualSearch,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Bar extends StatefulWidget {
  final SearchBarController<Product> searchBarProductController;
  final SearchBarController<Store> searchBarStoreController;
  final int actualSearch;

  Bar(
      {this.searchBarProductController,
      this.searchBarStoreController,
      this.actualSearch});

  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  Widget build(BuildContext context) {
    log(widget.actualSearch.toString());

    if (widget.actualSearch == 0)
      return MySearchBar(widget.searchBarProductController);
    else
      return MySearchBart(widget.searchBarStoreController);
  }
}

class MySearchBar extends StatefulWidget {
  final SearchBarController<Product> _controller;

  MySearchBar(this._controller);

  @override
  _MySearchBarState createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  Future<List<Product>> _getAllProducts(String text) async {
    List<Product> filterProducts = [];
    await Future.delayed(Duration(seconds: 2));

    await getProducts().then((value) => value.forEach((element) {
          if (element.nombre.toLowerCase().contains(text.toLowerCase())) {
            filterProducts.add(element);
          }
        }));

    return filterProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: SearchBar<Product>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getAllProducts,
          searchBarController: widget._controller,
          cancellationWidget: Text("Cancelar"),
          emptyWidget: Text("Vacio"),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, 1),
          onCancelled: () {
            print("Cancelado");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Product product, int index) {
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.imgPath, scale: 0.2),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Align(
                  child: Text(
                    product.nombre,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MySearchBart extends StatefulWidget {
  final SearchBarController<Store> _controller;

  MySearchBart(this._controller);

  @override
  _MySearchBartState createState() => _MySearchBartState();
}

class _MySearchBartState extends State<MySearchBart> {
  Future<List<Store>> _getAllStores(String text) async {
    List<Store> filterStores = [];
    await Future.delayed(Duration(seconds: 2));

    await getSuscriptions().then((value) => value.forEach((element) {
          if (element.nombre.toLowerCase().contains(text.toLowerCase())) {
            filterStores.add(element);
          }
        }));

    return filterStores;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: SearchBar<Store>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getAllStores,
          searchBarController: widget._controller,
          cancellationWidget: Text("Cancelar"),
          emptyWidget: Text("Vacio"),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, 1),
          onCancelled: () {
            print("Cancelado");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Store store, int index) {
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(null, scale: 0.2),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Align(
                  child: Text(
                    store.nombre,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detalle"),
          ],
        ),
      ),
    );
  }
}
