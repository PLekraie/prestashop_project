import 'package:flutter/material.dart';
import 'shop.dart';
import 'map.dart';
import 'dart:async';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => new _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return new Center();
  }

// void snack() {
//   SnackBar snackBar = new SnackBar(
//     content: Text('Je suis le snack'),
//     duration: new Duration(seconds: 7),
//   );
//   Scaffold.of(context).showSnackBar(snackBar);
// }
//
// Future<Null> alerte() async {
//   return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return new AlertDialog(
//           title: Text('nouveau dialog'),
//           content: Text('info du dialog'),
//           actions: <Widget>[
//             new FlatButton(
//                 onPressed: () {
//                   print('Confirmer');
//                   Navigator.pop(context);
//                 },
//                 child: Text('Confirmer')),
//           ],
//         );
//       });
// }

// Future<Null> dialog() async {
//   return showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return new SimpleDialog(
//           title: new Text('titre du dialog'),
//           children: <Widget>[
//             new Text('description'),
//             new RaisedButton(
//               onPressed: () {
//                 print('Clic clic');
//                 Navigator.pop(context);
//               },
//               child: Text('Bouton'),
//             )
//           ],
//         );
//       });
// }

// void pressed() {
//   setState(() {
//     print('OK');
//   });
// }

// void getNewScaffold() {
//   Navigator.push(context,
//       new MaterialPageRoute(builder: (BuildContext context) {
//     return new SecondScaffond('nouvelle page');
//   }));
// }
}
