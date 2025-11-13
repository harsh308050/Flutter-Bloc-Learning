import 'event.dart';
import 'state.dart';
import '/data/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserStates> {
  final Repo repo;

  UserBloc(this.repo) : super(UserInitialState()) {
    on<FetchUsersEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final result = await repo.fetchUsers();
        emit(UserLoadedState(result));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }

  // Future<void> onGetUsers(
  //   FetchUsersEvent event,
  //   Emitter<UserStates> emit,
  // ) async {
  //   emit(state.copyWith(apiStates: ApiStates.busy));

  //   try {
  //     final result = await repo.fetchUsers();
  //     emit(state.copyWith(apiStates: ApiStates.busy));
  //     emit(state.copyWith(apiStates: ApiStates.success, users: result));
  //     emit(state.copyWith(apiStates: ApiStates.none));
  //   } catch (e) {
  //     emit(state.copyWith(apiStates: ApiStates.busy));
  //     emit(state.copyWith(apiStates: ApiStates.error));
  //   }
  // }
}
