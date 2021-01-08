import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  String title;

  Shop(String title) {
    this.title = title;
  }

  get getNewScaffoldForAccount => null;

  get getNewScaffoldForShop => null;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: Image.asset('img/logo.png'),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip:
                MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          actions: <Widget>[
            new FlatButton(
                onPressed: getNewScaffoldForAccount,
                child: new Icon(Icons.account_circle_outlined)),
            new FlatButton(
                onPressed: getNewScaffoldForShop,
                child: new Icon(Icons.shopping_cart_rounded)),
          ],
          centerTitle: true,
          elevation: 2.0),
      body: new Center(
        child: Text('Panier'),
      ),
    );
  }
}
