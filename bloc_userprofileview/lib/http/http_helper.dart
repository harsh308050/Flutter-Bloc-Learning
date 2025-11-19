import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../utils/APIConstant.dart';

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../utils/APIConstant.dart';

Future<dynamic> postMethod({
  required String endpoint,
  Object? body,
  Map<String, String>? headers,
}) async {
  try {
    final url = Uri.parse(APIConstant.baseUrl + endpoint);
    final requestHeaders = headers ?? getSessionData();

    log("--------- URL ---------- $url");
    log("---------- Request ----------${jsonEncode(body)}");

    final response = await http.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(body),
    );

    return response;
  } catch (e) {
    log("POST ERROR $e");
  }
}

Future<dynamic> get() async {}

Map<String, String> getSessionData() {
  return {"Content-Type": "application/json", "Accept": "application/json"};
}

Future<dynamic> getMethod(String endpoints) async {
  try {
    final uri = Uri.parse(APIConstant.baseUrl + endpoints);

    log("----------URL------------   ${uri.toString()}");

    final response = await http.get(uri, headers: getSessionData());

    log("----------RESPONSE------------   ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error with Api and the status code is ${response.statusCode}');
    }
  } catch (e) {
    print('GET Error: $e');
  }
}

Future<dynamic> deleteMethod(
  String endpoints, {
  Map<String, dynamic>? queryParams,
}) async {
  try {
    final uri = Uri.parse(APIConstant.baseUrl + endpoints);

    log("----------URL------------   ${uri.toString()}");
    log("----------REQUEST------------   $queryParams");

    final response = await http.delete(
      uri,
      body: jsonEncode(queryParams),
      headers: getSessionData(),
    );

    log("----------RESPONSE------------   ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error with Api and the status code is ${response.statusCode}');
    }
  } catch (e) {
    print('DELETE Error: $e');
  }
}

Future<dynamic> patchMethod(
  String endpoints, {
  Map<String, dynamic>? queryParams,
}) async {
  try {
    final uri = Uri.parse(APIConstant.baseUrl + endpoints);

    log("----------URL------------   ${uri.toString()}");
    log("----------REQUEST------------   $queryParams");

    final response = await http.patch(
      uri,
      body: jsonEncode(queryParams),
      headers: getSessionData(),
    );

    log("----------RESPONSE------------   ${response.body}");

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Error with Api and the status code is ${response.statusCode}');
    }
  } catch (e) {
    print('PATCH Error: $e');
  }
}
