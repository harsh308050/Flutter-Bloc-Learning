import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../components/CustomAppBar.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColours.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UISizes.appbarHeight),
        child: CustomAppBar(isCenter: true, appbarTitle: 'User Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(UISizes.aroundPadding),
          child: Text('User Details Screen'),
        ),
      ),
    );
  }
}
