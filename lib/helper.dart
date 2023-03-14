import 'package:flutter/services.dart';
import 'dart:convert';

class Helper {
  static Future<Map<String, dynamic>> readData() async {
    final response = await rootBundle.loadString('assets/map.geojson');
    final data = await json.decode(response);
    return data;
  }
}
