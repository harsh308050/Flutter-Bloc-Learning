import '/model/model.dart';

// enum ApiStates { none, busy, success, error }

// class UserStates {
//   final ApiStates apiStates;
//   final UserModel? users;

//   const UserStates({this.apiStates = ApiStates.none, this.users});
//   UserStates copyWith({ApiStates? apiStates, UserModel? users}) {
//     return UserStates(
//       apiStates: apiStates ?? this.apiStates,
//       users: users ?? this.users,
//     );
//   }
// }

abstract class UserStates {}

class UserInitialState extends UserStates {}

class UserLoadingState extends UserStates {}

class UserLoadedState extends UserStates {
  final UserModel users;
  UserLoadedState(this.users);
}

class UserErrorState extends UserStates {
  final String message;
  UserErrorState(this.message);
}
