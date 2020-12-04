import 'package:flutter/material.dart';
import 'main.dart';

class Homepage extends StatelessWidget {
  String title;

  Homepage(String title) {
    this.title = title;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // title: new Text('Green citizen'),
        leading:
            new Image.asset('img/Prestashop-logo.png', fit: BoxFit.contain),
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
      body: Container(
        child: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Construire le formulaire avec _formKey créé au-dessus
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Veuillez saisir un texte';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Retourne true si le formulaire est valide, sinon false
                if (_formKey.currentState.validate()) {
                  // Affiche le Snackbar si le formulaire est valide
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Traitement en cours')));
                }
              },
              child: Text('Envoyer'),
            ),
          ),
        ],
      ),
    );
  }
}
