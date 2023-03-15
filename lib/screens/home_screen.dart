import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_data/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'data',
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('assets/map.geojson'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Text('null');
          }
          final data = jsonDecode(snapshot.data!);
          final fList = data['features'] as List;

          return ListView.builder(
            itemCount: fList.length,
            itemBuilder: (context, index) {
              final title = (fList[index]['properties']["name"] as String);
              final sub = (fList[index]['properties']["type"] as String);
              final programs =
                  (fList[index]['properties']["programs"] as String?);
              var icon = Image.asset('assets/images/food.png');

              if (sub == "bar") {
                icon = Image.asset(
                  'assets/images/bar.png',
                  alignment: Alignment.center,
                );
              } else if (sub == "food") {
                icon = Image.asset(
                  'assets/images/food.png',
                  alignment: Alignment.center,
                );
              } else if (sub == "toilet") {
                icon = Image.asset(
                  'assets/images/toilet.png',
                  alignment: Alignment.center,
                );
              } else if (sub == "visit") {
                icon = Image.asset(
                  'assets/images/visit.png',
                  alignment: Alignment.center,
                );
              } else if (sub == "venue") {
                icon = Image.asset(
                  'assets/images/venue.png',
                  alignment: Alignment.center,
                );
              } else if (sub == "parking") {
                icon = Image.asset(
                  'assets/images/parking.png',
                  alignment: Alignment.center,
                );
              } else if (sub == "infopoint") {
                icon = Image.asset(
                  'assets/images/infopoint.png',
                  alignment: Alignment.center,
                );
              }
              return Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: ListTile(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    sub,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  leading: icon,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScre(
                            title: title,
                            programs: programs,
                            icon: icon,
                          );
                        },
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
