import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String appbarTitle;
  const CustomAppBar({super.key, required this.appbarTitle});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: UIColours.white,
      forceMaterialTransparency: true,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          widget.appbarTitle,
          style: TextStyle(
            fontSize: UISizes.titleFontSize,
            color: UIColours.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
