import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

class Map extends StatelessWidget {
  String title;

  Map(String title) {
    this.title = title;
  }

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
                child: new Icon(Icons.account_circle_outlined)),
            new FlatButton(
                child: new Icon(Icons.shopping_cart_rounded)),
          ],
          centerTitle: true,
          elevation: 2.0),
      body: new Center(
        child: RaisedButton(
          child: Text('Sign in'),
          //onPressed: signIn,
        ),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: TextField(
                  decoration: InputDecoration(hintText: 'Vous recherchez ?'),
                )),
            ListTile(title: new Text("item 1")),
            ListTile(title: new Text("item 2")),
            ListTile(title: new Text("item 2")),
          ],
        ),
      ),
    );
  }
}
