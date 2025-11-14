import '/model/model.dart';

enum Status { none, success, busy, failed }

class ProductsState {
  final Status status;
  final ProductsModel? productsModel;

  const ProductsState({this.status = Status.none, this.productsModel});

  ProductsState copyWith(Status? status, ProductsModel? productsModel) {
    return ProductsState(
      status: status ?? this.status,
      productsModel: productsModel ?? this.productsModel,
    );
  }
}

class ProductsInitial extends ProductsState {}
