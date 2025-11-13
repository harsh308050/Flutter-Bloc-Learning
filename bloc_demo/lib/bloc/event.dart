import 'package:meta/meta.dart';

@immutable
abstract class UserEvent {}

class FetchUsersEvent extends UserEvent {}
