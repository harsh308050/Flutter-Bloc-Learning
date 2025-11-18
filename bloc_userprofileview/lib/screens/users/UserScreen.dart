import 'package:bloc_userprofileview/components/CustomAppBar.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColours.white,
      body: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(appbarTitle: UIStrings.appbarUsers),
          ),
        ),
      ),
    );
  }
}
