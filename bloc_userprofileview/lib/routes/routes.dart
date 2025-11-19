import 'package:bloc_userprofileview/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import '../screens/auth/loginscreen.dart';
import '../screens/auth/signupscreen.dart';
import '../screens/users/UserDetailsScreen.dart';

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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  static navigateToUserDetails(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const UserDetailsScreen()),
    );
  }
}
