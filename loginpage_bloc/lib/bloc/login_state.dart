import 'package:equatable/equatable.dart';
import 'package:loginpage_bloc/Model/model.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginDataState extends LoginState {
  LoginResModel? loginResModel;
  LoginDataState({this.loginResModel});

  @override
  List<Object?> get props => [loginResModel];
}

class LoginErrorState extends LoginState {
  String? errorMessage;
  LoginErrorState({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
