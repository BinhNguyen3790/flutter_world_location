import 'package:flutter/material.dart';
import 'package:flutter_world_location/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading";

  void setupWorldTime() async{
    WorldTime instance = WorldTime(
      location: "Berlin",
      flag: "germany.png",
      url: "Europe/London",
    );
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print("initState function");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(padding: EdgeInsets.all(50),child: Text(time),));
  }
}
