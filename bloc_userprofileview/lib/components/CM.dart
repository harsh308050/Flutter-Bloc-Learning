import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';

class CM {
  static void showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(fontWeight: FontWeight.w500, color: UIColours.white),
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UISizes.inputRadius),
        ),
      ),
    );
  }
}
