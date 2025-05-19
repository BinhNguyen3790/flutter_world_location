import 'package:flutter/material.dart';
import 'package:flutter_world_location/services/world_time.dart';

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  List<WorldTime> locations = [
    WorldTime(location: "Viet Nam", flag: "vn.png", url: "Asia/Ho_Chi_Minh"),
    WorldTime(location: "New York", flag: "usa.png", url: "America/New_York"),
    WorldTime(location: "London", flag: "uk.png", url: "Europe/London"),
    WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
    WorldTime(location: 'Seoul', flag: 'south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
  ];

  void handleTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

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
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Card(
              child: ListTile(
                onTap: () {
                  handleTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/img/${locations[index].flag}",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
