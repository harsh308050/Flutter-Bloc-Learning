import 'package:bloc_userprofileview/components/CustomTile.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              CustomTile(
                leadingIcon: UIIcons.fnameIcon,
                title: UIStrings.tileProfile,
                trailingIcon: UIIcons.arrowBtnIcon,
                onTap: () {
                  Routes.navigateToLoginScreen(context);
                },
              ),
              CustomTile(
                leadingIcon: UIIcons.dltBtnIcon,
                title: UIStrings.tileDelete,
                textColor: UIColours.red,
              ),
              CustomTile(
                leadingIcon: UIIcons.tileThemeIcon,
                title: UIStrings.tileTheme,
                subTitle: "System",
                trailingIcon: UIIcons.arrowBtnIcon,
              ),
              CustomTile(
                leadingIcon: CircleAvatar(
                  backgroundColor: UIColours.red.withOpacity(0.1),
                  child: Icon(
                    UIIcons.fnameIcon.icon,
                    size: UISizes.trailIconSize,
                  ),
                ),
                title: UIStrings.fnameHint,
                subTitle: UIStrings.emailformatHint,
                trailingIcon: UIIcons.arrowBtnIcon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
