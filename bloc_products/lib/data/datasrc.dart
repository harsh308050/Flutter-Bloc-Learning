import 'dart:convert';

import 'package:http/http.dart' as http;

class DataSource {
  final String url = "https://dummyjson.com/products";
  Future<dynamic> fetchData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> fetchProductData(num id) async {
    var response = await http.get(Uri.parse("${url}/$id"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
