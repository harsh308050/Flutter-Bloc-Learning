import 'package:bloc_strcture/bloc/bloc.dart';
import 'package:bloc_strcture/bloc/event.dart';
import 'package:bloc_strcture/bloc/state.dart';
import 'package:bloc_strcture/data/datasrc.dart';
import 'package:bloc_strcture/data/repo.dart';
import 'package:bloc_strcture/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserBloc userBloc = UserBloc(Repo(DataSource()));
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    userBloc.add(FetchUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body:BlocConsumer<UserBloc, UserStates>(
      //   listener: (context, state) {
      //     userModel = state.users;
      //   },
      //   bloc: userBloc,
      //   builder: (context, state) {
      //     if (state.apiStates == ApiStates.busy) {
      //       return CircularProgressIndicator();
      //     }
      //     if (userModel != null) {
      //       final list = userModel!.data;
      //       return ListView.builder(
      //         itemCount: list!.length,
      //         itemBuilder: (context, index) {
      //           final item = list[index];
      //           final attr = item.attributes;

      //           return Column(
      //             children: [
      //               Text(
      //                 attr!.name ?? "",
      //                 style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 16,
      //                   color: Colors.black,
      //                 ),
      //               ),
      //             ],
      //           );
      //         },
      //       );
      //     }

      //     return Container();
      //   },
      // ),
      // );
      // body: BlocListener<UserBloc, UserStates>(
      //   listener: (context, state) {
      //     userModel = state.users;
      //   },
      //   bloc: userBloc,

      //   child: BlocBuilder<UserBloc, UserStates>(
      //     bloc: userBloc,
      //     builder: (context, state) {
      //       if (state.apiStates == ApiStates.busy) {
      //         return CircularProgressIndicator();
      //       }
      //       if (userModel != null) {
      //         final list = userModel!.data;
      //         return ListView.builder(
      //           itemCount: list!.length,
      //           itemBuilder: (context, index) {
      //             final item = list[index];
      //             final attr = item.attributes;

      //             return Column(
      //               children: [
      //                 Text(
      //                   attr!.name ?? "",
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 16,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //               ],
      //             );
      //           },
      //         );
      //       }

      //       return Container();
      //     },
      //   ),
      // ),
      body: BlocBuilder<UserBloc, UserStates>(
        bloc: userBloc,
        builder: (context, state) {
          if (state is UserLoadingState) {
            return CircularProgressIndicator();
          } else if (state is UserLoadedState) {
            final list = state.users.data;
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context, index) {
                final item = list[index];
                final attr = item.attributes;

                return Column(
                  children: [
                    Text(
                      attr!.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            );
          }

          return Container();
        },
      ),
    );

    // );
  }
}






// Column(
//         children: [
//           Center(child: Text('Personal Data')),
//           Text("Harsh Parmar"),
//           Text("email@gamil.com"),
//           Text("9898236835"),
//           Center(child: Text('Company Data')),
//           Text("Harsh Parmar"),
//           Text("email@gamil.com"),
//           Text("9898236835"),
//         ],
//       ),