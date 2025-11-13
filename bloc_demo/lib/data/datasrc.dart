import 'dart:convert';

import 'package:http/http.dart' as http;

class DataSource {
  String url = "https://dogapi.dog/api/v2/breeds";
  Future<dynamic> getUsers() async {
    var resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      return jsonDecode(resp.body);
    } else {
      throw Exception('No Response');
    }
  }
}
