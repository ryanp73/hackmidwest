import 'package:flutter/material.dart';
import 'package:twilio_dart/resources/accounts.dart';
import 'package:twilio_dart/resources/calls.dart';
import 'package:twilio_dart/resources/messages.dart';
import 'package:twilio_dart/twilio.dart';
import 'package:twilio_dart/twilio_browser.dart';
import 'package:twilio_dart/utils/http_headers.dart';
import 'package:twilio_dart/utils/utils.dart';

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