import 'package:bloc_userprofileview/bloc/model/user_model.dart';
import 'package:bloc_userprofileview/components/CM.dart';
import 'package:bloc_userprofileview/components/CustomTextButton.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../utils/SharedPrefHelper.dart';
import '../../components/CustomAppBar.dart';
import '../../routes/routes.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  UserModel? user = sharedPrefGetUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColours.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UISizes.appbarHeight),
        child: CustomAppBar(
          isCenter: true,
          suffixIcon: CustomTextButton(
            buttonText: UIStrings.editBtn,
            onTextButtonPressed: () {
              Routes.navigateToEditUserDetailsScreen(context, user: user);
            },
          ),
          appbarTitle: UIStrings.appbarUserDetails,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(UISizes.aroundPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: UIColours.white,
                      backgroundImage: (user?.image != null && user!.image!.isNotEmpty)
                          ? NetworkImage(user!.image!)
                          : null,
                      child: (user?.image == null || user!.image!.isEmpty)
                          ? Icon(
                              Icons.person,
                              size: 60,
                              color: UIColours.grey,
                            )
                          : null,
                    ),
                    SizedBox(height: UISizes.mainSpacing * 2),
                    Text(
                      '${user?.firstName} ${user?.lastName}',
                      style: TextStyle(
                        fontSize: UISizes.tileTitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CM.SbhMin(),
                    Text(
                      user?.email ?? '',
                      style: TextStyle(
                        color: UIColours.grey,
                        fontSize: UISizes.inputFontSize,
                      ),
                    ),
                  ],
                ),
              ),
              CM.SbhMain(),
              CM.SbhMain(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: UISizes.subSpacing + 5,
                ),
                child: Column(
                  children: [
                    userInfoTile(
                      icon: Icons.person_outline,
                      title: UIStrings.fname,
                      value: user?.firstName ?? '',
                    ),
                    userInfoTile(
                      icon: Icons.tag_outlined,
                      title: UIStrings.username,
                      value: user?.username ?? '',
                    ),
                    userInfoTile(
                      icon: Icons.wc_outlined,
                      title: UIStrings.gender,
                      value: user?.gender ?? '',
                    ),
                    userInfoTile(
                      icon: Icons.email_outlined,
                      title: UIStrings.emailLabel,
                      value: user?.email ?? '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userInfoTile({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: UISizes.mainSpacing),
      child: Row(
        spacing: UISizes.midSpacing,
        crossAxisAlignment: .center,
        children: [
          Icon(
            icon,
            color: UIColours.primaryColor,
            size: UISizes.titleFontSize * 1.2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: UISizes.tileSubtitle,
                  color: UIColours.grey,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: UISizes.tileTitle - 1,
                  color: UIColours.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
