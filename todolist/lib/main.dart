import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'TodoListUI.dart';
import 'todoCubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: TodoListUI(),
      ),
    );
  }
}
