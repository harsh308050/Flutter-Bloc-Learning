import 'event.dart';
import 'state.dart';
import '/data/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<ProductEvent, ProductsState> {
  final Repository repository;
  DataBloc(this.repository) : super(ProductsInitial()) {
    on<ProductsEvent>(onProductEvent);
    on<ProductDetailsEvent>(onProductDetailsEvent);
  }
  Future<void> onProductEvent(
    ProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(Status.busy, null));
    try {
      final productsModel = await repository.getData();
      emit(state.copyWith(Status.success, productsModel));
    } catch (e) {
      emit(state.copyWith(Status.failed, null));
    }
  }

  Future<void> onProductDetailsEvent(
    ProductDetailsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(Status.busy, null));
    try {
      final productsModel = await repository.getProductData(event.id);
      emit(state.copyWith(Status.success, productsModel));
    } catch (e) {
      emit(state.copyWith(Status.failed, null));
    }
  }
}
