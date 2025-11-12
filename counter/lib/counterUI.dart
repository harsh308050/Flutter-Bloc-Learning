import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter.dart';

class CounterUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Counter, int>(
        builder: (context, count) => Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                '$count',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () => context.read<Counter>().inc(),
                child: Container(
                  height: 100,
                  width: 300,
                  child: Center(child: Text("Increment")),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () => context.read<Counter>().dec(),
                child: Container(
                  height: 100,
                  width: 300,
                  child: Center(child: Text("Decrement")),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
