import 'package:bloc_userprofileview/components/CustomButton.dart';
import 'package:bloc_userprofileview/components/CustomTextButton.dart';
import 'package:bloc_userprofileview/components/CustomTextField.dart';
import 'package:bloc_userprofileview/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColours.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(UISizes.aroundPadding),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: UIColours.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: UIIcons.logoIcon,
                    ),
                    SizedBox(height: UISizes.mainSpacing),
                    Text(
                      UIStrings.loginTitle,
                      style: TextStyle(
                        fontSize: UISizes.titleFontSize,
                        color: UIColours.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: UISizes.mainSpacing),
                    CustomTextfield(
                      controller: emailController,
                      hintText: UIStrings.emailHint,
                      labelText: UIStrings.emailLabel,
                      prefixIcon: UIIcons.emailIcon,
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
                    SizedBox(height: UISizes.midSpacing),
                    CustomTextfield(
                      controller: passwordController,
                      hintText: UIStrings.passwordHint,
                      labelText: UIStrings.passwordLabel,
                      prefixIcon: UIIcons.passwordIcon,
                      onSuffixPressed: () {
                        setState(() {
                          obsecureText = !obsecureText;
                        });
                      },
                      obscureText: obsecureText,
                      suffixIcon: obsecureText == true
                          ? UIIcons.passwordEyeIcon.icon
                          : UIIcons.passwordEyeDisabledIcon.icon,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 3) {
                          return 'Password must be at least 3 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: UISizes.midSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomTextButton(buttonText: UIStrings.forgotPassword),
                      ],
                    ),
                    SizedBox(height: UISizes.mainSpacing),
                    CustomButton(
                      buttonText: UIStrings.loginButton,
                      onButtonPressed: () {
                        if (formKey.currentState!.validate()) {
                          Routes.navigateToHomePage(context);
                        }
                      },
                    ),
                    SizedBox(height: UISizes.mainSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          UIStrings.newOnApp,
                          style: TextStyle(
                            color: UIColours.greyShade,
                            fontSize: UISizes.inputFontSize,
                          ),
                        ),
                        CustomTextButton(
                          buttonText: UIStrings.signupButton,
                          onTextButtonPressed: () {
                            Routes.navigateToSignupScreen(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
