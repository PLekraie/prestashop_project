import 'package:flutter/material.dart';
import 'main.dart';

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

class Account extends StatelessWidget {
  String title;
  final _formKey = GlobalKey<FormState>();

  Account(String title) {
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
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.mail),
                  hintText: 'Entrez votre mail',
                  labelText: 'Email',
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Champs obligatoire';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Entrez votre nom',
                  labelText: 'Nom',
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Champs obligatoire';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.security),
                  hintText: 'Entrez votre mot de passe',
                  labelText: 'Mot de passe',
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Champs obligatoire';
                  }
                  return null;
                },
              ),
              new Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text('S\'inscrire'),
                    onPressed: () {
                      // It returns true if the form is valid, otherwise returns false
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context).showSnackBar(SnackBar(content : Text('Bienvenue !')));
                      }
                    },
                  )
              ),
            ],
          )
      ),
    );

  }
}
