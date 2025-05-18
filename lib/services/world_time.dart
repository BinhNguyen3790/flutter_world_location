import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  // String location;
  // String time;
  // String flag;
  // String url;

  void getTime() async {
    Response response = await get(
      Uri.parse(
        // 'https://script.googleusercontent.com/macros/echo?user_content_key=AehSKLji3H91_XGLV7M6LSuLy_mBBI5cAnRApvygpWP9mfsfkX7mWhAFVLKnIfvu62ypWBh5tdmRfxavQPuP7UOyFKTYOOGOyALJ5bnLt9v0Y4B2DkvK8kIFQVlJvYYXl26CBxOAnN-ZZvhaV-Rox0q5mZjIA3UVwRA6IsRxDVM0JAncmv-iMY6bWqi0S2dRHVD4vttMC5fujMqyK3d2SMI-f9JFFlwPVArO5f2JJjDyR9VHU6Vo1F9CY8Ndr8ovXK2tTrGC9h4yXGpoxr3Y9z4zA4kSMaxaUF2aEZqfANOP&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk',
        'https://script.google.com/macros/s/AKfycbyd5AcbAnWi2Yn0xhFRbyzS4qMq1VucMVgVvhul5XqS9HkAyJY/exec?tz=Europe/Madrid',
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
    } catch (e) {
      print("Error: $e");
    }
  }
}
