import 'package:flutter/material.dart';
import 'main.dart';

class Shop extends StatelessWidget {
  String title;

  Shop(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // title: new Text('Green citizen'),
        leading: new Image.asset('img/Prestashop-logo.png',
            fit: BoxFit.contain),
        actions: <Widget>[
          new FlatButton(
              // onPressed: ,
              child: new Icon(Icons.account_box)),
          new FlatButton(
              // onPressed: ,
              child: new Icon(Icons.gps_fixed)),
          new FlatButton(
              // onPressed: ,
              child: new Icon(Icons.shopping_cart_rounded)),
          new FlatButton(
              // onPressed: ,
              child: new Icon(Icons.camera_alt))
        ],
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: Text('liste commerce'),
      ),
    );
  }
}
