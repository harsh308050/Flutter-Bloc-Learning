import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage_bloc/Model/model.dart';
import 'package:loginpage_bloc/bloc/login_bloc.dart';
import 'package:loginpage_bloc/bloc/login_event.dart';
import 'package:loginpage_bloc/bloc/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController unameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, state) {
          if (state is LoginInitialState) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome to the Login Page'),
                  TextField(
                    controller: unameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context).add(
                        LoginPressed(
                          loginReqModel: LoginReqModel(
                            username: unameController.text,
                            password: passController.text,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          } else if (state is LoginLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginDataState) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${state.loginResModel?.firstName}"),
                  Text("Email: ${state.loginResModel?.email}"),
                  Text("Gender: ${state.loginResModel?.gender}"),
                  Text("Profile Image:"),
                  Image.network(
                    state.loginResModel?.image ??
                        'https://placehold.co/600x400/EEE/31343C',
                  ),
                ],
              ),
            );
          } else if (state is LoginErrorState) {
            return Center(
              child: Text(
                'Login Failed: ${state.errorMessage ?? 'Unknown error'}',
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
