import 'package:flutter/material.dart';
import 'package:happy_hour/code/Data.dart';
import 'package:happy_hour/models/bar.dart';
import 'package:android_intent/android_intent.dart';

class BarDetail extends StatefulWidget {
  final Bar bar;
  BarDetail(this.bar);

  @override
  _BarDetailState createState() => _BarDetailState();
}

class _BarDetailState extends State<BarDetail> {
  @override
  void initState() {
    print('in Bar Detail');
    //_loadData();
  }

   void _launchNavigationInGoogleMaps() async{
    var lon = widget.bar.long;
    var lat = widget.bar.lat;
    print('lon: $lon, lat: $lat');
    if (Theme.of(context).platform == TargetPlatform.android) {
      final AndroidIntent intent = new AndroidIntent(
          action: 'action_view',
          data: "http://maps.google.com/maps?daddr=${lat},${lon}",
          package: 'com.google.android.apps.maps');
      intent.launch();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.bar.name),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(icon: Icon(Icons.directions), onPressed: _launchNavigationInGoogleMaps, color: Colors.redAccent, iconSize: 50.0,)
            ])
          ],
        ));
  }
}
