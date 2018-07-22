import 'package:flutter/material.dart';
import 'package:servicestack/client.dart';

class Global{
  static JsonServiceClient JsonClient;
  static JsonServiceClient HttpClient() {
    if (Global.JsonClient == null) {
      Global.JsonClient = JsonServiceClient();
      return Global.JsonClient;
    } else
      return Global.JsonClient;
  }
}