import 'package:meta/meta.dart';

@immutable
abstract class CatEvent {}

class FetchCatBreedsEvent extends CatEvent {}
