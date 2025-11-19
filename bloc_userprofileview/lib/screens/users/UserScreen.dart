import 'package:bloc_userprofileview/components/CustomAppBar.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../components/CM.dart';
import '../../components/CustomSearchBar.dart';
import '../../components/CustomTile.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColours.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UISizes.appbarHeight),
        child: CustomAppBar(
          appbarTitle: UIStrings.appbarUsers,
          suffixIcon: IconButton(icon: UIIcons.filter, onPressed: () {}),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(UISizes.aroundPadding),
            child: Column(
              children: [
                CustomSearchBar(
                  hintText: UIStrings.searchbarHint,
                  controller: searchController,
                ),
                CM.SbhMain(),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      spacing: UISizes.subSpacing,
                      children: [
                        CustomTile(
                          leadingIcon: CircleAvatar(
                            backgroundColor: UIColours.primaryColor,
                            child: Icon(Icons.person, color: UIColours.white),
                          ),
                          title: UIStrings.fname,
                          subTitle: UIStrings.emailformatHint,
                          trailingIcon: UIIcons.arrowBtnIcon,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
