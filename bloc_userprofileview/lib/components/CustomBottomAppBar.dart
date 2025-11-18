import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
// import '../utils/utils.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  const CustomBottomAppBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      showUnselectedLabels: false,
      backgroundColor: UIColours.white,
      selectedItemColor: UIColours.primaryColor,
      unselectedItemColor: UIColours.grey,
      onTap: onTap != null ? (index) => onTap!(index) : null,
      items: [
        BottomNavigationBarItem(
          icon: UIIcons.fnameIcon,
          label: UIStrings.appbarUsers,
        ),
        BottomNavigationBarItem(
          icon: UIIcons.settingsIcon,
          label: UIStrings.appbarSettings,
        ),
      ],
    );
  }
}
