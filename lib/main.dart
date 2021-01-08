import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
    await Dio().get('https://jsonplaceholder.typicode.com/todos');
    return response.data;
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
                      style: TextStyle(fontSize: 25.0, color: Colors.blueAccent,),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(
                              20.0, 15.0, 20.0, 15.0),
                          prefixIcon: Icon(Icons.people),
                          hintText: "Recherche ...",
                          border: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)))
                  )),
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
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                                child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      new Card(
                                          elevation: 5.0,
                                          child: new Container(
                                              height: 200,
                                              width: 200,
                                              child: new Text(
                                                  snapshot.data[index]['title']))),
                                    ]));
                          });
                  }
                }))
      //         child: new Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     new Card(
      //         elevation: 5.0,
      //         child: new Container(
      //           width: 50,
      //           height:50,
      //         )),
      //     new Card(
      //         elevation: 5.0,
      //         child: new Container(
      //           width: 50,
      //           height:50,
      //         )),
      //   ],
      // ))),
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
