import 'package:flutter/material.dart';
import 'package:flutter_world_location/pages/home.dart';
import 'package:flutter_world_location/pages/loading.dart';
import 'package:flutter_world_location/pages/location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home":(context)=> Home(),
      "/location":(context)=> Locations(),
    }
  ));
}
