import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title) {
    final todo = Todo(id: DateTime.now().toString(), title: title);
    emit([...state, todo]);
  }

  void removeTodo(String id) {
    emit(state.where((todo) => todo.id != id).toList());
  }
}
