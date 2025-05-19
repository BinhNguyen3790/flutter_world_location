import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String flag;
  String time = "loading";
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    Response response = await get(
      Uri.parse(
        'https://script.google.com/macros/s/AKfycbyd5AcbAnWi2Yn0xhFRbyzS4qMq1VucMVgVvhul5XqS9HkAyJY/exec?tz=$url',
      ),
    );
    Map data = jsonDecode(response.body);
    print(data);
    String datetime = data["fulldate"];
    String offset = datetime.split("+").last.trim().substring(0, 2);
    print(datetime);
    print(offset);
    DateFormat format = DateFormat("EEE, dd MMM yyyy HH:mm:ss Z");
    try {
      DateTime now = format.parse(datetime);
      print(now);
      now = now.add(Duration(hours: int.parse(offset)));
      time = now.toString();
    } catch (e) {
      print("Error: $e");
    }
  }
}
