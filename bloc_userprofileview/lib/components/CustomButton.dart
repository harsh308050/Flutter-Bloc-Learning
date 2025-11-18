import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onButtonPressed;
  final String buttonText;
  const CustomButton({
    super.key,
    this.onButtonPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: UIColours.primaryColor,
        minimumSize: Size(double.infinity, UISizes.btnHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UISizes.inputRadius),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: UISizes.btnFontSize,
          fontWeight: FontWeight.bold,
          color: UIColours.white,
        ),
      ),
    );
  }
}
