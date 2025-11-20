import 'package:bloc_userprofileview/screens/SplashScreen.dart';
import 'package:bloc_userprofileview/utils/SharedPrefHelper.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:bloc_userprofileview/bloc/model/user_model.dart';
import 'package:bloc_userprofileview/bloc/model/user_res_model.dart';

UserModel? user;
UserResModel? userDetails;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: UIColours.white,
      theme: ThemeData(
        primaryColor: UIColours.primaryColor,
        fontFamily: 'Roboto',
      ),
      home: SplashScreen(),
    );
  }
}
