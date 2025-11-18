import 'package:bloc_userprofileview/components/CM.dart';
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
          padding: EdgeInsets.only(
            top: UISizes.aroundPadding * 5,
            left: UISizes.aroundPadding,
            right: UISizes.aroundPadding,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    UIStrings.loginTitle,
                    style: TextStyle(
                      fontSize: UISizes.titleFontSize,
                      color: UIColours.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CM.SbhMain(),
                  CustomTextfield(
                    controller: emailController,
                    hintText: UIStrings.emailHint,
                    labelText: UIStrings.emailLabel,
                    prefixIcon: UIIcons.emailIcon,
                    validator: (value) {
                      return CM.inputvalidator(value, "Email");
                    },
                  ),
                  CM.SbhSub(),
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
                      return CM.inputvalidator(value, "Password");
                    },
                  ),
                  CM.SbhSub(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomTextButton(buttonText: UIStrings.forgotPassword),
                    ],
                  ),

                  CM.SbhMin(),
                  CustomButton(
                    buttonText: UIStrings.loginButton,
                    onButtonPressed: () {
                      if (formKey.currentState!.validate()) {
                        Routes.navigateToHomePage(context);
                      }
                    },
                  ),
                  CM.SbhSub(),
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
    );
  }
}
