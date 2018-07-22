import 'package:flutter/material.dart';
import 'restaurants_view.dart';
import 'bars_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Happy Hour'),
    );
  }
}

class _Page {
  _Page({this.icon, this.text});
  final IconData icon;
  final String text;
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _navigationViews;
  List<_Page> _pages = List<_Page>();

  @override
  void initState() {
    this._loadPages();
  }

  _loadPages() {
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Offstage(
          offstage: false,
          child: TickerMode(
            enabled: true,
            child: buildBody(),
          )),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.fastfood), iconSize: 26.0, color: Colors.red, splashColor: Colors.red, highlightColor: Colors.red, onPressed: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => BarsView()))),
                  Text('BARS', style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.fastfood), iconSize: 26.0, color: Colors.red, splashColor: Colors.red, highlightColor: Colors.red, onPressed: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => RestaurantsView()))),
                  Text('RESTAURANTS', style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              )
            ]
          )
        ]
      )
    );
  }
}
