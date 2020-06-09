import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/models/storeModel.dart';
import 'package:armageddon_app/screens/auth/ShopScreen.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:armageddon_app/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

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

  Future<LocationData> testLocationPermision() async {
    Location location = new Location();
    LocationData _locationData;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return _locationData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Scaffold(
        backgroundColor: BackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(27),
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
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder(
                future: testLocationPermision(),
                builder: (BuildContext context,
                    AsyncSnapshot<LocationData> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (!snapshot.hasData)
                      return Text('Permiso ubicación denegado');
                    String latitude = snapshot.data.latitude.toString();
                    String longitude = snapshot.data.longitude.toString();
                    return Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Latitude: ' + latitude + ' longitude: ' + longitude,
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  } else
                    return Container();
                },
              ),
              MySearchBarController(
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

class MySearchBarController extends StatefulWidget {
  final SearchBarController<Product> searchBarProductController;
  final SearchBarController<Store> searchBarStoreController;
  final int actualSearch;

  MySearchBarController(
      {this.searchBarProductController,
      this.searchBarStoreController,
      this.actualSearch});

  @override
  _MySearchBarControllerState createState() => _MySearchBarControllerState();
}

class _MySearchBarControllerState extends State<MySearchBarController> {
  Widget build(BuildContext context) {
    if (widget.actualSearch == 0)
      return MySearchBarProducts(widget.searchBarProductController);
    else
      return MySearchBarStores(widget.searchBarStoreController);
  }
}

class MySearchBarProducts extends StatefulWidget {
  final SearchBarController<Product> _controller;

  MySearchBarProducts(this._controller);

  @override
  _MySearchBarProductsState createState() => _MySearchBarProductsState();
}

class _MySearchBarProductsState extends State<MySearchBarProducts> {
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
          searchBarStyle: SearchBarStyle(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getAllProducts,
          searchBarController: widget._controller,
          cancellationWidget: Container(
            alignment: Alignment.centerRight,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              color: PrimaryPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Cancelar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          /* TODO put location here */
          header: null,
          emptyWidget: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              gradient: LinearGradient(
                colors: [PrimaryPurple, Color(0xFFB5B0E7)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400].withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              '¡Uy! ¡No he encontrado nada!',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, 1),
          onCancelled: () {
            print("Cancelado");
          },
          mainAxisSpacing: 17,
          crossAxisSpacing: 17,
          crossAxisCount: 2,
          onItemFound: (Product product, int index) {
            return FutureBuilder(
              future: getStoreById(product.idTienda),
              builder: (BuildContext context, AsyncSnapshot<Store> snapshot) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new ShopScreen(
                        store: snapshot.data,
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(product.imgPath, scale: 0.2),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[400].withOpacity(0.3),
                          spreadRadius: 0.5,
                          blurRadius: 6,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            product.nombre,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            product.precio.toString() + ' €',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MySearchBarStores extends StatefulWidget {
  final SearchBarController<Store> _controller;

  MySearchBarStores(this._controller);

  @override
  _MySearchBarStoresState createState() => _MySearchBarStoresState();
}

class _MySearchBarStoresState extends State<MySearchBarStores> {
  Future<List<Store>> _getAllStores(String text) async {
    List<Store> filterStores = [];
    await Future.delayed(Duration(seconds: 2));

    await getStores().then((value) => value.forEach((element) {
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
          searchBarStyle: SearchBarStyle(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getAllStores,
          searchBarController: widget._controller,
          cancellationWidget: Container(
            alignment: Alignment.centerRight,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              color: PrimaryPurple,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Cancelar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          /* TODO put location here */
          header: null,
          emptyWidget: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 34),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              gradient: LinearGradient(
                colors: [PrimaryPurple, Color(0xFFB5B0E7)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400].withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              '¡Uy! ¡No he encontrado nada!',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, 1),
          onCancelled: () {
            print("Cancelado");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Store store, int index) {
            return GestureDetector(
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://imgmedia.lbb.in/media/2018/08/5b898c57fe22575b86710050_1535741015631.jpg",
                          scale: 0.2),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Align(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        store.nombre,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopScreen(store: store),
                  ),
                );
              },
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
