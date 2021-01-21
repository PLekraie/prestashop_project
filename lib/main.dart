import 'dart:collection';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'account.dart';
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
  Future<List> articles;

  //Lien à remplacer par celui de notre API
  Future<List> getArticles() async {
    var response =
        await Dio().get('http://51.254.205.197/api/products/?display=full',
            options: Options(headers: {
              'Authorization':
                  'Basic S0pXRDE5MTE1WDdOUEFKSlhNS0dERFlCU0JSQVRES0M6',
              'Output-Format': 'JSON'
            }));
    //le premier est pas un vrai article
    var articlesFromAPI = response.data['products'];
    articlesFromAPI.removeAt(0);
    return articlesFromAPI;
  }

  @override
  void initState() {
    articles = getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child: TextField(
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.people),
                          hintText: "Recherche ...",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0))))),
              ListTile(title: new Text("item 1")),
              ListTile(title: new Text("item 2")),
              ListTile(title: new Text("item 2")),
            ],
          ),
        ),
        body: new Container(
            child: FutureBuilder<List>(
                future: articles,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Aucun article trouvé.');
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Text('En attente de résultat...');
                    case ConnectionState.done:
                      if (snapshot.hasError)
                        return Text('Error : ${snapshot.error}');
                      return ListView.builder(
                          itemCount: 18,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                                child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  InkWell(
                                    onTap: () {
                                      getNewScaffoldForProduct(
                                          snapshot.data[index]['id']);
                                      print(snapshot.data[index]['id']);
                                    },
                                    child: new Card(
                                      elevation: 5.0,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(12.0, 25.0, 12.0, 15.0),
                                        child: new Container(
                                            width: 200,
                                            child: new Column(children: [
                                              new Text(
                                                  snapshot.data[index]['name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14)),
                                              Html(
                                                  data: snapshot.data[index]
                                                      ['description_short'])
                                            ])),
                                      ),
                                    ),
                                  )
                                ]));
                          });
                  }
                })));
  }

  void getNewScaffoldForProduct(int id) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => DetailScreen(id: id)));
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
      return new Account('Account');
    }));
  }

  void getNewScaffoldForCamera() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new Shop('Camera');
    }));
  }
}

class DetailScreen extends StatefulWidget {
  final int id;

  DetailScreen({Key key, @required this.id}) : super(key: key);

  @override
  _DetailScreen createState() {
    return new _DetailScreen();
  }
}

class _DetailScreen extends State<DetailScreen> {
  Future<LinkedHashMap<String, dynamic>> article;

  Future<LinkedHashMap<String, dynamic>> getArticle(int id) async {
    var response =
        await Dio().get('http://51.254.205.197/api/products/' + id.toString(),
            options: Options(headers: {
              'Authorization':
                  'Basic S0pXRDE5MTE1WDdOUEFKSlhNS0dERFlCU0JSQVRES0M6',
              'Output-Format': 'JSON'
            }));
    return response.data['product'];
  }

  @override
  void initState() {
    article = getArticle(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<LinkedHashMap>(
            future: article,
            builder:
                (BuildContext context, AsyncSnapshot<LinkedHashMap> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(snapshot.data['name']);
              } else {
                return Text('Connexion en attente');
              }
            }),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<LinkedHashMap>(
            future: article,
            builder:
                (BuildContext context, AsyncSnapshot<LinkedHashMap> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: <Widget>[
                    Text("Fabricant : " + snapshot.data['manufacturer_name']),
                    Html(data: "Description : " + snapshot.data['description'])
                  ],
                );
              } else {
                return Text('Connexion en attente...');
              }
            }),
      ),
    );
  }
}
