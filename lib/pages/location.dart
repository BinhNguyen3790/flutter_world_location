import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  

  @override
  Widget build(BuildContext context) {
    print("build function");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Chose a Location"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: TextButton(
        onPressed: () {
        },
        child: Text("counter is"),
      ),
    );
  }
}
