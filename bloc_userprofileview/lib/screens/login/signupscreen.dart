import 'dart:io';

import 'package:bloc_userprofileview/components/CM.dart';
import 'package:bloc_userprofileview/components/CustomAppBar.dart';
import 'package:bloc_userprofileview/components/CustomProfile.dart';
import 'package:bloc_userprofileview/components/GenderButton.dart';
import 'package:bloc_userprofileview/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../components/CustomButton.dart';
import '../../components/CustomTextButton.dart';
import '../../components/CustomTextField.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  File? image;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColours.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UISizes.appbarHeight),
        child: CustomAppBar(appbarTitle: UIStrings.signupTitle),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(UISizes.aroundPadding),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        spacing: UISizes.subSpacing,
                        children: [
                          CustomProfile(
                            onTap: () {
                              CM.pickImage(ImageSource.gallery, picker).then((
                                file,
                              ) async {
                                if (file != null) {
                                  setState(() {
                                    image = file;
                                  });
                                }
                              });
                            },
                            imagePath: image != null
                                ? image!.path
                                : AssetsPath.profile,
                            child: Container(
                              padding: EdgeInsets.all(4),
                              child: image != null
                                  ? UIIcons.editIcon
                                  : UIIcons.addIcon,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: UIColours.white,
                                  width: 2,
                                ),
                                color: UIColours.primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Row(
                            spacing: UISizes.subSpacing,
                            children: [
                              Expanded(
                                child: CustomTextfield(
                                  controller: firstNameController,
                                  hintText: UIStrings.fnameHint,
                                  labelText: UIStrings.fname,
                                  validator: (value) {
                                    return CM.inputvalidator(
                                      value,
                                      "First Name",
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: CustomTextfield(
                                  controller: lastNameController,
                                  hintText: UIStrings.lnameHint,
                                  labelText: UIStrings.lname,
                                  validator: (value) {
                                    return CM.inputvalidator(
                                      value,
                                      "Last Name",
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          CustomTextfield(
                            controller: ageController,
                            hintText: UIStrings.ageHint,
                            labelText: UIStrings.age,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return CM.inputvalidator(value, "Age");
                            },
                          ),
                          Column(
                            spacing: UISizes.minSpacing,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                UIStrings.gender,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),

                              Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: UIColours.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  spacing: 5,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Genderbutton(
                                      onGenderChanged: () {
                                        setState(() {
                                          isMale = true;
                                        });
                                      },
                                      label: "Male",
                                      isMale: isMale,
                                    ),
                                    Genderbutton(
                                      onGenderChanged: () {
                                        setState(() {
                                          isMale = false;
                                        });
                                      },
                                      label: "Female",
                                      isMale: !isMale,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CustomTextfield(
                            controller: emailController,
                            hintText: UIStrings.emailHint,
                            labelText: UIStrings.emailLabel,
                            validator: (value) {
                              return CM.inputvalidator(value, "Email");
                            },
                          ),
                          CustomTextfield(
                            controller: passwordController,
                            hintText: UIStrings.passwordHint,
                            labelText: UIStrings.passwordLabel,
                            validator: (value) {
                              return CM.inputvalidator(value, "Password");
                            },
                          ),
                        ],
                      ),
                      CM.SbhMain(),
                      CM.SbhMain(),
                      CustomButton(
                        buttonText: UIStrings.signupButton,
                        onButtonPressed: () {
                          if (formKey.currentState!.validate()) {
                            Routes.navigateToHomePage(context);
                          }
                        },
                      ),
                      CM.SbhMin(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            UIStrings.haveAccount,
                            style: TextStyle(
                              color: UIColours.greyShade,
                              fontSize: UISizes.inputFontSize,
                            ),
                          ),
                          CustomTextButton(
                            buttonText: UIStrings.loginButton,
                            onTextButtonPressed: () {
                              Routes.navigateToLoginScreen(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
