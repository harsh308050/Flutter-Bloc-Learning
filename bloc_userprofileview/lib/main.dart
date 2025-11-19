import 'package:bloc_userprofileview/utils/Helper.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import 'screens/auth/loginscreen.dart';
import 'dart:developer';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();
  var user = await SharedPrefsHelper.getData('user');
  log(user.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: UIColours.white,
      theme: ThemeData(
        primaryColor: UIColours.primaryColor,
        fontFamily: 'Roboto',
      ),
      home: LoginScreen(),
    );
  }
}
