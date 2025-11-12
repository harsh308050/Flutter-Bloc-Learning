import 'package:loginpage_bloc/bloc/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage_bloc/bloc/login_state.dart';
import 'package:loginpage_bloc/repo/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginPressed>((event, emit) async {
      emit(LoginLoadingState());
      try {
        var response = await LoginRepo().login(
          event.loginReqModel?.username ?? "",
          event.loginReqModel?.password ?? "",
        );
        emit(LoginDataState(loginResModel: response));
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    });
  }
}
