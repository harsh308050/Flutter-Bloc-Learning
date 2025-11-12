import 'package:equatable/equatable.dart';
import 'package:loginpage_bloc/Model/model.dart';

abstract class LoginEvent extends Equatable {}

class LoginPressed extends LoginEvent {
  LoginReqModel? loginReqModel;
  LoginPressed({this.loginReqModel});
  @override
  List<Object?> get props => [loginReqModel];
}
