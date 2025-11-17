import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import 'screens/login/loginscreen.dart';

void main() {
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
