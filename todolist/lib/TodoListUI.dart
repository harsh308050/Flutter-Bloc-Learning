import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'todoCubit.dart';
import 'model.dart';

class TodoListUI extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  TodoListUI({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TodoCubit>();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter Task',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  cubit.addTodo(controller.text.trim());
                  controller.clear();
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),

            Expanded(
              child: BlocBuilder<TodoCubit, List<Todo>>(
                builder: (context, todo) {
                  if (todo.isEmpty) {
                    return const Center(child: Text('No Tasks Added'));
                  }
                  return ListView.builder(
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      final task = todo[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          spacing: 10,
                          children: [
                            Text((index + 1).toString()),
                            Text(task.title),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(70, 50),
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  cubit.removeTodo(task.id);
                                }
                              },
                              child: const Text(
                                'Remove',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
