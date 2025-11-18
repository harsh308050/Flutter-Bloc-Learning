import 'dart:io';
import 'package:flutter/material.dart';

class CustomProfile extends StatefulWidget {
  final VoidCallback? onTap;
  final String imagePath;
  final Icon? icon;
  final Widget? child;
  const CustomProfile({
    super.key,
    this.onTap,
    required this.imagePath,
    this.icon,
    this.child,
  });

  @override
  State<CustomProfile> createState() => _CustomProfileState();
}

class _CustomProfileState extends State<CustomProfile> {
  bool isFile() {
    return File(widget.imagePath).existsSync();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          isFile()
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    File(widget.imagePath),
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
          Positioned(
            bottom: 5,
            right: 5,
            child: widget.child != null ? widget.child! : SizedBox(),
          ),
        ],
      ),
    );
  }
}
