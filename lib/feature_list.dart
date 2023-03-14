import 'package:flutter/material.dart';

class FeatureList extends StatelessWidget {
  const FeatureList({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: (data["features"] as List<dynamic>).length,
        itemBuilder: (context, index) {
          final features = (data["features"] as List<dynamic>)[index];

          final coords = (features["geometry"]
              as Map<String, dynamic>)["coordinates"] as List;
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("type: ${features["type"]}"),
                const Text("properties:"),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                        "name: ${(features["properties"] as Map<String, dynamic>)["name"]}"),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                        "type: ${(features["properties"] as Map<String, dynamic>)["type"]}"),
                  ],
                ),
                const Text("geomatry:"),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "type: ${(features["geometry"] as Map<String, dynamic>)["type"]}",
                    ),
                  ],
                ),
                Row(
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "coordinates: ",
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: coords
                          .map((e) => SizedBox(
                                width: 300,
                                child: Text(
                                  e.toString(),
                                  softWrap: true,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
