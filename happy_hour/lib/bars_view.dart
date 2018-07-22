import 'package:flutter/material.dart';

class BarsView extends StatefulWidget {

  BarsView();

  @override
  _BarsViewState createState() => _BarsViewState();
}

class _BarsViewState extends State<BarsView> {
  @override
  void initState(){
    print('in BarsView');
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Bars'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Bars')
            ],
          )
        ],
      ),
    );
  }
}