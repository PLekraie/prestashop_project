import 'package:flutter/material.dart';
import 'shop.dart';
import 'homepage.dart';
import 'layout.dart';
import 'map.dart';

void main() {
  runApp(new MyApp());
}

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mon application',
      theme: ThemeData(primarySwatch: white),
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

bool color = false;

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Projet prestashop'),
        leading: new FlatButton(onPressed: getNewScaffoldForHome,
          child: Image.asset('img/Prestashop-logo.png'),
        ),
        // leading: new Image.asset('img/logo_greencitizen-court.png',
        //     fit: BoxFit.contain),
        actions: <Widget>[
          new FlatButton(
              onPressed: getNewScaffoldForAccount,
              child: new Icon(Icons.account_box)),
          new FlatButton(
              onPressed: getNewScaffoldForMap,
              child: new Icon(Icons.gps_fixed)),
          new FlatButton(
              onPressed: getNewScaffoldForShop,
              child: new Icon(Icons.shopping_cart_rounded)),
          new FlatButton(
              onPressed: getNewScaffoldForCamera,
              child: new Icon(Icons.camera_alt))
        ],
        centerTitle: true,
        elevation: 20.0
      ),
      // body: new Layout(
      // color: Colors.yellow,
      // margin: EdgeInsets.all(10.0),
      //   child: new Center(
      //     // child: new Column(
      //     //   // mainAxisAlignment: MainAxisAlignment.start,
      //     //   crossAxisAlignment: CrossAxisAlignment.start,
      //     //   children: <Widget>[
      //     //     new Text(
      //     // 'nouvelle colonne !',
      //     //     style: new TextStyle(
      //     //         color: Colors.red,
      //     //       fontSize: 12.0
      //     //     ),
      //     //     ),
      //     //     new Image.network('https://via.placeholder.com/150')
      //     //   ],
      //     // )
      //     child: new Container(
      //       margin: EdgeInsets.only(left: 15.0, top: 15.0),
      //       height: 75.0,
      //       width: 300,
      //       color: Colors.deepPurple,
      //       child: new Row(
      //         children: <Widget>[
      //           new Container(
      //             margin: EdgeInsets.only(left: 15.0),
      //             height: 50,
      //             width: 50,
      //             color: Colors.white,
      //           )
      //         ],
      //       ),
      //     ),
      // )
      // ),
    );
  }

  void getNewScaffoldForHome() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
          return new Homepage('Homepage');
        }));
  }

  void getNewScaffoldForShop() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
          return new Shop('Shop');
        }));
  }

  void getNewScaffoldForMap() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
          return new Map('Map');
        }));
  }

  void getNewScaffoldForAccount() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
          return new Map('Account');
        }));
  }

  void getNewScaffoldForCamera() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
          return new Shop('Camera');
        }));
  }
}
