import 'package:bloc_userprofileview/components/CustomTile.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../components/CustomAppBar.dart';
import '../../routes/routes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UISizes.appbarHeight),
        child: CustomAppBar(
          isCenter: false,
          appbarTitle: UIStrings.appbarSettings,
        ),
      ),
      backgroundColor: UIColours.white,
      body: Padding(
        padding: EdgeInsets.all(UISizes.aroundPadding),
        child: Column(
          spacing: UISizes.mainSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTile(
              leadingIcon: CircleAvatar(
                backgroundColor: UIColours.white,
                radius: 30,
                child: Image.asset(AssetsPath.profile),
              ),
              title: UIStrings.tileProfile,
              subTitle: UIStrings.emailformatHint,
            ),
            Text(
              UIStrings.settingsGeneral,
              style: TextStyle(
                fontSize: UISizes.tileTitle,
                color: UIColours.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTile(
              leadingIcon: UIIcons.fnameIcon,
              title: UIStrings.tileProfile,
              trailingIcon: UIIcons.arrowBtnIcon,
              onTap: () {
                Routes.navigateToUserDetails(context);
              },
            ),
            CustomTile(
              leadingIcon: UIIcons.tileThemeIcon,
              title: UIStrings.tileTheme,
              trailingIcon: UIIcons.arrowBtnIcon,
            ),
            Text(
              UIStrings.settingsAccount,
              style: TextStyle(
                fontSize: UISizes.tileTitle,
                color: UIColours.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            CustomTile(
              leadingIcon: UIIcons.logout,
              title: UIStrings.tileLogout,
            ),
            CustomTile(
              textColor: UIColours.errorColor,
              leadingIcon: UIIcons.dltBtnIcon,
              title: UIStrings.tileDelete,
            ),
          ],
        ),
      ),
    );
  }
}
