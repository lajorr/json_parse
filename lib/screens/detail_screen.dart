// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailScre extends StatelessWidget {
  const DetailScre({
    Key? key,
    required this.title,
    required this.programs,
    required this.icon,
  }) : super(key: key);
  final String title;
  final String? programs;
  final Image icon;

  @override
  Widget build(BuildContext context) {
    List<String> strList = [];
    if (programs != null) {
      strList = programs!.split(';');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          icon,
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: strList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          (index % 2 == 0)
                              ? Icons.menu
                              : Icons.person_2_outlined,
                          size: 28,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            strList[index],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: (index % 2 == 0)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  );

                  // ListTile(
                  // leading: Icon(
                  //   (index % 2 == 0) ? Icons.menu : Icons.person_2_outlined,
                  // ),
                  // title: Text(
                  //   strList[index],
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: (index % 2 == 0)
                  //         ? FontWeight.bold
                  //         : FontWeight.normal,
                  //   ),
                  // ),
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
