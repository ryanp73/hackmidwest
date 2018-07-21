import 'package:flutter/material.dart';

class RestaurantsView extends StatefulWidget {

  RestaurantsView();

  @override
  _RestaurantsViewState createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  @override
  void initState(){
    print('in ResturantsView');
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Restaurants')
            ],
          )
        ],
      ),
    );
  }
}
