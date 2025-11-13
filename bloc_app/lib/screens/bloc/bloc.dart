import '/screens/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository.dart';
import 'event.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final CatRepository _repository;

  CatBloc(this._repository) : super(CatInitial()) {
    on<FetchCatBreedsEvent>(_onFetchBreeds);
  }

  Future<void> _onFetchBreeds(
    FetchCatBreedsEvent event,
    Emitter<CatState> emit,
  ) async {
    emit(state.copyWith(callState: ApiCallState.busy));

    try {
      final result = await _repository.getCatBreeds();
      emit(state.copyWith(callState: ApiCallState.busy));
      emit(state.copyWith(callState: ApiCallState.success, model: result));
      emit(state.copyWith(callState: ApiCallState.none));
    } catch (e) {
      emit(state.copyWith(callState: ApiCallState.busy));
      emit(state.copyWith(callState: ApiCallState.failure));
    }
  }
}
