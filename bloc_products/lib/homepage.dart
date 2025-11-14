import 'package:bloc_products/bloc/event.dart';
import 'package:bloc_products/data/datasrc.dart';
import 'package:bloc_products/model/model.dart';
import 'package:bloc_products/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'bloc/state.dart';
import 'data/repository.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final DataBloc dataBloc = DataBloc(Repository(DataSource()));
  ProductsModel? model;

  @override
  void initState() {
    super.initState();
    dataBloc.add(ProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Homepage',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<DataBloc, ProductsState>(
        bloc: dataBloc,
        listener: (context, state) {
          if (state.status == Status.success) {
            model = state.productsModel;
          }
          if (state.status == Status.failed) {
            print("error");
          }
        },

        child: BlocBuilder<DataBloc, ProductsState>(
          bloc: dataBloc,
          builder: (context, state) {
            if (state.status == Status.busy && model == null) {
              return Center(child: CircularProgressIndicator());
            }
            if (model != null) {
              final list = model!.products!;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Productdetails(id: list[index].id!),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                list[index].thumbnail ?? '',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list[index].title ?? '',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueAccent.shade700,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  if (list[index].brand != null)
                                    Text(
                                      list[index].brand ?? '',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  Text(
                                    list[index].price.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    list[index].description ?? '',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: Text('No Data Found'));
          },
        ),
      ),
    );
  }
}
