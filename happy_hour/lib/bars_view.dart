import 'package:flutter/material.dart';
import 'package:happy_hour/bar_detail.dart';
import 'package:happy_hour/code/Data.dart';
import 'package:happy_hour/models/bar.dart';

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