import 'package:bloc_userprofileview/bloc/model/user_model.dart';
import 'package:bloc_userprofileview/components/CustomAppBar.dart';
import 'package:bloc_userprofileview/routes/routes.dart';
import 'package:bloc_userprofileview/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../components/CM.dart';
import '../../components/CustomButton.dart';
import '../../components/CustomTextField.dart';
import '../../utils/SharedPrefHelper.dart';

class EditUserDetailsScreen extends StatefulWidget {
  const EditUserDetailsScreen({super.key});

  @override
  State<EditUserDetailsScreen> createState() => _EditUserDetailsScreenState();
}

class _EditUserDetailsScreenState extends State<EditUserDetailsScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FocusNode fnameFocusNode = FocusNode();
  final FocusNode lnameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode genderFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  void initState() {
    super.initState();
    UserModel? user = sharedPrefGetUser();
    fnameController.text = user?.firstName ?? '';
    lnameController.text = user?.lastName ?? '';
    genderController.text = user?.gender?.toString() ?? '';
    emailController.text = user?.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(appbarTitle: UIStrings.appbarEditProfile),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UISizes.aroundPadding),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  spacing: UISizes.subSpacing,
                  children: [
                    CustomTextfield(
                      focusNode: fnameFocusNode,
                      controller: fnameController,
                      hintText: UIStrings.fnameHint,
                      labelText: UIStrings.fname,
                      validator: (value) {
                        return CM.inputvalidator(value, "First Name");
                      },
                    ),

                    CustomTextfield(
                      focusNode: lnameFocusNode,
                      controller: lnameController,
                      hintText: UIStrings.lnameHint,
                      labelText: UIStrings.lname,
                      validator: (value) {
                        return CM.inputvalidator(value, "Last Name");
                      },
                    ),
                    // CustomTextfield(
                    //   focusNode: ageFocusNode,
                    //   controller: ageController,
                    //   hintText: UIStrings.ageHint,
                    //   value: widget.user.?.toString(),
                    //   labelText: UIStrings.age,
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     return CM.inputvalidator(value, "Age");
                    //   },
                    // ),
                    CustomTextfield(
                      focusNode: genderFocusNode,
                      controller: genderController,
                      hintText: UIStrings.gender,
                      labelText: UIStrings.gender,
                      validator: (value) {
                        return CM.inputvalidator(value, "Gender");
                      },
                    ),
                    CustomTextfield(
                      focusNode: emailFocusNode,
                      controller: emailController,
                      hintText: UIStrings.emailHint,
                      suffixIcon: Icons.lock_outline,
                      labelText: UIStrings.emailLabel,
                      validator: (value) {
                        return CM.inputvalidator(value, "Email");
                      },
                    ),
                  ],
                ),
                CustomButton(
                  buttonText: UIStrings.editprofileButton,
                  onButtonPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (fnameController.text.isEmpty) {
                      focusNodeRoute(fnameFocusNode, context);
                      return;
                    }
                    if (lnameController.text.isEmpty) {
                      focusNodeRoute(lnameFocusNode, context);
                      return;
                    }
                    if (emailController.text.isEmpty) {
                      focusNodeRoute(emailFocusNode, context);
                      return;
                    }
                    if (genderController.text.isEmpty) {
                      focusNodeRoute(genderFocusNode, context);
                      return;
                    }
                    Routes.popScreen(context);

                    if (formKey.currentState!.validate()) {}
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
