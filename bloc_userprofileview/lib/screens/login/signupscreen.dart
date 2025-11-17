import 'package:bloc_userprofileview/components/CustomAppBar.dart';
import 'package:bloc_userprofileview/components/GenderButton.dart';
import 'package:bloc_userprofileview/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../components/CustomButton.dart';
import '../../components/CustomTextButton.dart';
import '../../components/CustomTextField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
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
                          CustomTextfield(
                            controller: firstNameController,
                            hintText: UIStrings.fnameHint,
                            labelText: UIStrings.fname,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                          CustomTextfield(
                            controller: lastNameController,
                            hintText: UIStrings.lnameHint,
                            labelText: UIStrings.lname,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                          CustomTextfield(
                            controller: ageController,
                            hintText: UIStrings.ageHint,
                            labelText: UIStrings.age,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your age';
                              }
                              if (value.length > 3 ||
                                  int.tryParse(value) == null) {
                                return 'Please enter a valid age';
                              }
                              return null;
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
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              ).hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          CustomTextfield(
                            controller: passwordController,
                            hintText: UIStrings.passwordHint,
                            labelText: UIStrings.passwordLabel,
                            validator: (value) {
                              if (value == null) {
                                return 'Please enter your password';
                              }
                              if (value.length < 3) {
                                return 'Password must be at least 3 characters';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: UISizes.mainSpacing * 2),
                      CustomButton(
                        buttonText: UIStrings.signupButton,
                        onButtonPressed: () {
                          if (formKey.currentState!.validate()) {
                            Routes.navigateToHomePage(context);
                          }
                        },
                      ),
                      SizedBox(height: UISizes.minSpacing),
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
