import 'dart:developer';

import 'package:bloc_userprofileview/bloc/bloc/event.dart';
import 'package:bloc_userprofileview/bloc/data/datasource.dart';
import 'package:bloc_userprofileview/bloc/model/model.dart';
import 'package:bloc_userprofileview/components/CM.dart';
import 'package:bloc_userprofileview/components/CustomButton.dart';
import 'package:bloc_userprofileview/components/CustomTextButton.dart';
import 'package:bloc_userprofileview/components/CustomTextField.dart';
import 'package:bloc_userprofileview/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/utils.dart';
import '../../bloc/bloc/bloc.dart';
import '../../bloc/bloc/state.dart';
import '../../bloc/data/repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final UserBloc userBloc = UserBloc(repository: Repository(DataSource()));
  UserModel? model;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColours.white,
      body: BlocListener<UserBloc, AppState>(
        bloc: userBloc,
        listener: (context, state) {
          if (state.status == Status.success) {
            // model = state.user;
            log('Login Successful: ${state.user}');
            Routes.navigateToHomePage(context);
          } else if (state.status == Status.failed) {
            CM.showSnackBar(
              context,
              UIStrings.loginFailed,
              UIColours.errorColor,
            );
          }
        },
        child: BlocBuilder<UserBloc, AppState>(
          bloc: userBloc,
          builder: (context, state) => SafeArea(
            child: state.status == Status.busy
                ? Center(
                    child: CircularProgressIndicator(
                      color: UIColours.primaryColor,
                    ),
                  )
                : Padding(
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
                              // validator: (value) {
                              //   return CM.inputvalidator(value, "Email");
                              // },
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
                                CustomTextButton(
                                  buttonText: UIStrings.forgotPassword,
                                ),
                              ],
                            ),

                            CM.SbhMin(),
                            CustomButton(
                              buttonText: UIStrings.loginButton,
                              onButtonPressed: () {
                                if (formKey.currentState!.validate()) {
                                  userBloc.add(
                                    UserEvent(
                                      username: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
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
        ),
      ),
    );
  }
}
