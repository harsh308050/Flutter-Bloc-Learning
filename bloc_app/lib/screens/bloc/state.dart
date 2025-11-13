import '../model/model.dart';

enum ApiCallState { none, busy, success, failure }

class CatState {
  final ApiCallState callState;
  final Model? model;

  const CatState({this.callState = ApiCallState.none, this.model});

  CatState copyWith({ApiCallState? callState, Model? model}) {
    return CatState(
      callState: callState ?? this.callState,
      model: model ?? this.model,
    );
  }
}

class CatInitial extends CatState {}