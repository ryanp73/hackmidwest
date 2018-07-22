import 'package:flutter/material.dart';
import 'package:happy_hour/bar_detail.dart';
import 'package:happy_hour/code/Data.dart';
import 'package:happy_hour/models/bar.dart';

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
      home: BarsView(),
    );
  }
}

class BarsView extends StatefulWidget {

  BarsView();

  @override
  _BarsViewState createState() => _BarsViewState();
}

class _BarsViewState extends State<BarsView> {
  @override
  void initState(){
    print('in BarsView');
    _loadData();

  }

  void _onTappedBar(Bar bar){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => BarDetail(bar)));
  }

  void _loadData() async{
    await Data.LoadBarsAndRestaurants();
    setState(() {
          
        });
  }

  Widget _buildBarList() {
    List<Widget> barsAndRestaurants = List<Widget>();
    Data.Bars.forEach((bar){
      var temp = ListTile(
        title: Text(bar.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),),
        subtitle: Text(bar.location),
        onTap:() { _onTappedBar(bar); },
        leading: Icon(
          Icons.fastfood,
          color: Colors.red[500]
        ),
      );
      barsAndRestaurants.add(temp);
      setState(() {
              
      });
    });

       return ListView(children: barsAndRestaurants);
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Happy Hour'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: _buildBarList()
    );
  }
}

