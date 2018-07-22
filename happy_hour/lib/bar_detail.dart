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
    print('happyhour: ${widget.bar.happyHour}');
    // if(widget.bar.happyHour)
  }

  void _launchNavigationInGoogleMaps() async {
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
          children: <Widget>[
            SizedBox(height: 16.0),
            Text(
              'Happy Hours: ${widget.bar.happyHour[0]}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Price: ${widget.bar.price}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Rating: ${widget.bar.rating}',
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              IconButton(
                icon: Icon(Icons.directions),
                onPressed: _launchNavigationInGoogleMaps,
                color: Colors.redAccent,
                iconSize: 50.0,
              )
            ]),
          ],
        ));
  }
}
