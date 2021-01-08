import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';

class Account extends StatelessWidget {
  String title;

  Account(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.amber,
      appBar: new AppBar(
        // title: new Text('Green citizen'),
        leading: new Image.asset('img/Prestashop-logo.png',
            fit: BoxFit.contain),
        actions: <Widget>[
          new FlatButton(
              // onPressed: ,
              child: new Icon(Icons.account_box)),
          new FlatButton(
              // onPressed: getNewScaffold,
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
        child: Text('account'),
      ),
    );
  }
}
