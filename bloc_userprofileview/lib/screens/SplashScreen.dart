import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import '../routes/routes.dart';
import 'package:bloc_userprofileview/main.dart';

import '../utils/SharedPrefHelper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var userToken = sharedPrefGetToken();
    Future.delayed(Duration(seconds: 3), () {
      userToken != null
          ? Routes.navigateToHomePage(context, user: user)
          : Routes.navigateToLoginScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UIColours.primaryColor,
        child: Center(
          child: Text(
            'UserApp',
            style: TextStyle(
              fontSize: UISizes.titleFontSize,
              fontWeight: FontWeight.bold,
              color: UIColours.white,
            ),
          ),
        ),
      ),
    );
  }
}
