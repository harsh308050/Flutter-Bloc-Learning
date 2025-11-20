import 'dart:developer';
import 'package:bloc_userprofileview/components/CustomTile.dart';
import 'package:bloc_userprofileview/main.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/userDetailsBloc/bloc.dart';
import '../../bloc/bloc/userDetailsBloc/event.dart';
import '../../bloc/bloc/userDetailsBloc/state.dart';
import '../../bloc/data/datasource.dart';
import '../../bloc/data/repository.dart';
import '../../bloc/model/user_res_model.dart';
import '../../components/CM.dart';
import '../../components/CustomAppBar.dart';
import '../../routes/routes.dart';
import '../../utils/SharedPrefHelper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final UserDetailsBloc userBloc = UserDetailsBloc(
    repository: Repository(DataSource()),
  );

  void initState() {
    super.initState();
    if (user == null) {
      userBloc.add(UserDetailsEvent());
    } else {
      userDetails = sharedPrefGetUser();
    }
  }

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
      body: BlocListener<UserDetailsBloc, UserDetailsAppState>(
        bloc: userBloc,
        listener: (context, state) {
          if (state.status == UserDetailsStatus.success) {
            userDetails = state.userdetails;
            log("User details loaded from API");
          } else if (state.status == UserDetailsStatus.failed) {
            CM.showSnackBar(
              context,
              "Failed to load user details",
              UIColours.errorColor,
            );
          }
        },
        child: BlocBuilder<UserDetailsBloc, UserDetailsAppState>(
          bloc: userBloc,
          builder: (context, state) => Padding(
            padding: EdgeInsets.all(UISizes.aroundPadding),
            child: Column(
              spacing: UISizes.mainSpacing,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTile(
                  leadingIcon: CircleAvatar(
                    backgroundColor: UIColours.white,
                    radius: 30,
                    backgroundImage: NetworkImage('${userDetails?.image}'),
                  ),
                  title:
                      (userDetails?.firstName ?? '') +
                      ' ' +
                      (userDetails?.lastName ?? ''),
                  subTitle: userDetails?.email ?? '',
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
                  onTap: () {
                    sharedPrefClearAllData();
                    log("Logged out");
                    Routes.navigateToLoginScreen(context);
                  },
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
        ),
      ),
    );
  }
}
