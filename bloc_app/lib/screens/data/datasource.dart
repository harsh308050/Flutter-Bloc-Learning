// lib/bloc/datasource.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class CatDataSource {
  static const String url = "https://dogapi.dog/api/v2/breeds";

  Future<dynamic> fetchCatBreeds() async {
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);   // <-- ONLY RAW DATA
    } else {
      throw Exception("Failed to load data (code: ${response.statusCode})");
    }
  }
}