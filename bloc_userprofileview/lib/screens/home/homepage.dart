import 'package:bloc_userprofileview/components/CustomBottomAppBar.dart';
import 'package:bloc_userprofileview/screens/settings/SettingsScreen.dart';
import 'package:bloc_userprofileview/screens/users/UserScreen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  late List<Widget> screen;
  @override
  void initState() {
    super.initState();
    screen = [UserScreen(), SettingsScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screen[_currentIndex]),
      bottomNavigationBar: CustomBottomAppBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
