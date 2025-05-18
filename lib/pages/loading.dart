import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response = await get(
      Uri.parse(
        'https://script.google.com/macros/s/AKfycbyd5AcbAnWi2Yn0xhFRbyzS4qMq1VucMVgVvhul5XqS9HkAyJY/exec?tz=Europe/London',
      ),
    );
    Map data = jsonDecode(response.body);
    print(data);
    String datetime = data["fulldate"];
    String offset = datetime.split("+").last.trim().substring(0,2);
    print(datetime);
    print(offset);
    DateFormat format = DateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
    try {
      DateTime now = format.parse(datetime);
      print(now);
      now=now.add(Duration(hours: int.parse(offset)));
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getTime();
    print("initState function");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("loading page"));
  }
}
