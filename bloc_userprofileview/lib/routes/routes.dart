import 'package:bloc_userprofileview/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import '../screens/login/loginscreen.dart';
import '../screens/login/signupscreen.dart';

class Routes {
  static navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  static navigateToSignupScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupScreen()),
    );
  }

  static navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }
}
