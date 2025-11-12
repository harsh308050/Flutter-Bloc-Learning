import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginpage_bloc/Model/model.dart';

class LoginRepo {
  login(String username, String password) async {
    var api = "https://dummyjson.com/auth/login";
    LoginReqModel loginReqModel = LoginReqModel(
      username: username,
      password: password,
    );
    http.Response response = await http.post(
      Uri.parse(api),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginReqModel.toJson()),
    );

    try {
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        return LoginResModel.fromJson(res);
      } else {
        print("Error: ${response.statusCode}");
        SnackBar(content: Text("Error: ${response.statusCode}"));
        return LoginResModel();
      }
    } catch (e) {
      SnackBar(content: Text(e.toString()));
      print(e.toString());
    }
  }
}
