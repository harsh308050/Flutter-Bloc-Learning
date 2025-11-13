import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/datasource.dart';
import 'bloc/repository.dart';
import 'data/bloc.dart';
import 'data/event.dart';
import 'data/state.dart';
import 'model/model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   CatBloc catBloc = CatBloc(CatRepository(CatDataSource()));
   Model? catModel;

  @override
  void initState() {
    super.initState();
    catBloc.add(FetchCatBreedsEvent()); /// api call with bloc
  }

  @override
  void dispose() {
    catBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cat Breeds (Bloc + API Demo)")),
      body: BlocListener<CatBloc, CatState>(
        bloc: catBloc,
        listener: (context, state) {
          if(state.callState == ApiCallState.success){
            catModel = state.model;
          }
          if(state.callState == ApiCallState.failure){
            print("error");
          }
        },
        child: BlocBuilder<CatBloc, CatState>(
          bloc: catBloc,
          builder: (context, state) {
            // Busy → show loader
            if (state.callState == ApiCallState.busy && catModel == null) {
              return const Center(child: CircularProgressIndicator());
            }

            // When catModel is ready → show list
            if (catModel != null && catModel!.data != null) {
              final list = catModel!.data!;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final item = list[index];
                  final attr = item.attributes;

                  return Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        attr?.name ?? "Unknown",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            attr?.description ?? "No description",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Lifespan: ${attr?.life?.min ?? '-'} - ${attr?.life?.max ?? '-'} years",
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Hypoallergenic: ${attr?.hypoallergenic == true ? 'Yes' : 'No'}",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            // Default empty state
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}