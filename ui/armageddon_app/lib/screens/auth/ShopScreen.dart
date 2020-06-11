import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/cartModel.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/models/storeModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:armageddon_app/services/dataPutService.dart';
import 'package:armageddon_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ShopScreen extends StatefulWidget {
  final Store store;

  ShopScreen({Key key, @required this.store}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _FloatingCollapsed extends StatefulWidget {
  final Cart cart;

  _FloatingCollapsed({this.cart});
  @override
  __FloatingCollapsedState createState() => __FloatingCollapsedState();
}

class __FloatingCollapsedState extends State<_FloatingCollapsed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: FutureBuilder(
          future: widget.cart.length(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Padding(
              padding: const EdgeInsets.all(27.0),
              child: Icon(Icons.shopping_cart, color: Colors.white),
            );
          },
        ),
      ),
    );
  }
}

class _FloatingPanel extends StatefulWidget {
  final Cart cart;
  final Store store;
  _FloatingPanel({this.cart, this.store});

  @override
  _FloatingPanelState createState() => _FloatingPanelState();
}

class _FloatingPanelState extends State<_FloatingPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0.5,
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),
      margin: const EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                  itemCount: widget.cart.productos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.cart.deleteProduct(index);
                        });
                      },
                      child: Item(
                          text: widget.cart.productos[index].nombre,
                          cantidad: widget.cart.productos[index].cantidad),
                    );
                  }),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 27, vertical: 24),
            child: RaisedButton(
              onPressed: () {
                /*TODO Finalizar pedido */
                crearPedido(widget.store.id, widget.cart);
                //widget.items.
                //Navigator.push(context,
                //    MaterialPageRoute(builder: (context) => QRScreen()));
              },
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
                side: BorderSide(
                  color: PrimaryPurple,
                ),
              ),
              color: PrimaryPurple,
              child: Text(
                'Finalizar Compra',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShopScreenState extends State<ShopScreen> {
  Cart cart = Cart(productos: new List<Producto>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: true,
        renderPanelSheet: false,
        panel: _FloatingPanel(
          cart: cart,
          store: widget.store,
        ),
        collapsed: _FloatingCollapsed(cart: cart),
        body: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            //Fondo
            new Container(
              width: 450,
              height: 630,
              color: Colors.white,
            ),

            //Container rojo (imagen)
            new Container(
              width: 450,
              height: 225.0,
              color: Colors.redAccent,
            ),
            //Container Lila (Orid)

            Positioned(
              top: 180,
              bottom: 0,
              left: 20,
              right: 20,
              child: new Container(
                  height: 100,
                  decoration: new BoxDecoration(
                    color: PrimaryPurple,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    ),
                  ),
                  child: new Column(
                    children: <Widget>[
                      //Productos
                      Padding(
                        padding: const EdgeInsets.only(top: 70, right: 202),
                        child: Text(
                          "Productos",
                          style: new TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //lista productos
                      FutureBuilder<List<Product>>(
                          future: getProductsByStoreId(widget.store.id),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasError) {
                                return Text("Error");
                              }
                              return Expanded(
                                child: Container(
                                  child: GridView.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        Product product = snapshot.data[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            GestureDetector(
                                              onTap: () {
                                                int cantidad = 1;
                                                setState(() {
                                                  Producto p = new Producto(
                                                    id: product.id,
                                                    nombre: product.nombre,
                                                    cantidad: cantidad,
                                                  );
                                                  cart.addProduct(p);
                                                });
                                                Scaffold.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      product.nombre +
                                                          ' añadido al carrito',
                                                    ),
                                                  ),
                                                );
                                                //Add al carrito
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(17),
                                                ),
                                                child: Image.network(
                                                  product.imgPath,
                                                  height: 90,
                                                  width: 90,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              );
                            } else
                              return Center(child: CircularProgressIndicator());
                          }),
                    ],
                  )),
            ),

            //Container blanco (info)

            Positioned(
              top: 80,
              left: 45,
              right: 45,
              child: Container(
                height: 160,
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(30.0),
                      topRight: const Radius.circular(30.0),
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0),
                    )),
                child: new Column(
                  children: <Widget>[
                    //Indormacion tienda
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 150),
                      child: Text(
                        widget.store.nombre,
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 155),
                      child: Text(
                        "Ubicación tienda",
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 136),
                      child: Text(
                        'Latitud: ' + widget.store.latitud.toString(),
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 116),
                      child: Text(
                        'Longitud: ' + widget.store.longitud.toString(),
                        style: new TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //FIN INFO TIENDA
                  ],
                ),
              ),
            ),
            Positioned(
              top: 43,
              left: 315,
              right: 20,
              child: Container(
                height: 80,
                decoration: new BoxDecoration(
                  color: PrimaryPurple,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                    bottomLeft: const Radius.circular(30.0),
                    bottomRight: const Radius.circular(30.0),
                  ),
                ),
                child: new Column(
                  children: <Widget>[
                    //Indormación tienda
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 55.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
