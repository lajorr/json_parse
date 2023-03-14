import 'package:flutter/material.dart';
import 'package:json_data/feature_list.dart';
import 'package:json_data/json_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final data = JsonData.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'data',
        ),
      ),
      body: Column(
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
          Expanded(child: FeatureList(data: data)),
        ],
      ),
    );
  }
}
