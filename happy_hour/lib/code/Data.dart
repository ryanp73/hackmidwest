import 'dart:core';
import 'Global.dart';
import 'package:happy_hour/models/bar.dart';

class Data{
  static List<Bar> Bars = List<Bar>();

  static void LoadBarsAndRestaurants() async{
    Bars = List<Bar>();
    var url = 'https://midwest-happy-hour.herokuapp.com/all';
    var response = await Global.HttpClient().getAs(url);
    print(response);
    response.forEach(iterateMapEntry);
  }
  static void iterateMapEntry(key, value) {
    print('adding bar: $value');
    Bars.add(Bar.fromJson(value));
  }
}