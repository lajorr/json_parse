import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'feature_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Map<String, dynamic> data = {};

  // @override
  // void initState() {
  //   readData();
  //   super.initState();
  // }

  // Future<void> readData() async {
  //   try {
  //     final response = await rootBundle.loadString('assets/map.geojson');
  //     // if(response.)
  //     data = await json.decode(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final data = Helper.readData();

    // final d = ( as String);
    // final d = data.forEach((key, value) {
    //   print(key);
    // });
    // print(data["type"]);
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
          final jsData = snapshot.data;
          final data = jsonDecode(jsData!);

          return Column(
            children: [
              SizedBox(
                height: 150,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(
                        "type : ${(data["type"] as String)}",
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "generator : ${(data["generator"] as String)}",
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        "features : ",
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FeatureList(data: data),
              ),
            ],
          );
        },
      ),
    );
  }
}
