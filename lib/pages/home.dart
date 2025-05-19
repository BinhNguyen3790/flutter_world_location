import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments is Map) {
      data = data.isNotEmpty ? data : arguments;
    } else {
      print("Arguments is not a Map!");
    }
    print(data);

    String bgImage = data['isDaytime'] ? "day.png" : "night.png";
    Color? bgColor =
        data['isDaytime']
            ? const Color.fromARGB(255, 21, 136, 200)
            : const Color.fromARGB(255, 39, 39, 96);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      "/location",
                    );
                    setState(() {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "flag": result["flag"],
                        "isDaytime": result["isDaytime"],
                      };
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit_location, color: Colors.grey[200]),
                      Text(
                        "Edit location",
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/img/${data["flag"]}"),
                      radius: 20,
                    ),
                    SizedBox(width: 15),
                    Text(
                      data["location"],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
