import 'package:meta/meta.dart';

@immutable
abstract class ProductEvent {}

class ProductsEvent extends ProductEvent {}

class ProductDetailsEvent extends ProductEvent {
  final num id;
  ProductDetailsEvent(this.id);
}
