import 'package:armageddon_app/constants.dart';
import 'package:armageddon_app/models/productModel.dart';
import 'package:armageddon_app/services/dataGetService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackgroundColor,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Profile'),
            backgroundColor: Colors.white)
      ]),
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
                    return Container(
                      margin: EdgeInsets.only(top: 27, left: 24, right: 24),
                      padding: EdgeInsets.only(
                          left: 24, top: 24, right: 0, bottom: 8),
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
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    child: Image.network(
                                      product.imgPath,
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    child: Image.network(
                                      product.imgPath,
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    child: Image.network(
                                      product.imgPath,
                                      height: 70,
                                      width: 70,
                                    ),
                                  )
                                ],
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
                          Text(
                            'Mañanas',
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                          Text(
                            '3 Productos',
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
