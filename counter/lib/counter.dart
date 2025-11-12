import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends Cubit<int> {
  Counter() : super(0);
  void inc() {
    emit(state + 1);
  }

  void dec() {
    emit(
      state <= 0 ? state : state - 1,
    ); //Here the condition refers that if <0 than stays 0 //for negative counting allowance you can remove the condition
  }
}
