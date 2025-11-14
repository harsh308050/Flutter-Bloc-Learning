import 'package:bloc_products/bloc/bloc.dart';
import 'package:bloc_products/bloc/event.dart';
import 'package:bloc_products/bloc/state.dart';
import 'package:bloc_products/data/datasrc.dart';
import 'package:bloc_products/data/repository.dart';
import 'package:bloc_products/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productdetails extends StatefulWidget {
  final int id;
  const Productdetails({super.key, required this.id});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  final DataBloc dataBloc = DataBloc(Repository(DataSource()));
  Products? product;
  bool showMore = false;

  @override
  void initState() {
    super.initState();
    dataBloc.add(ProductDetailsEvent(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DataBloc, ProductsState>(
      bloc: dataBloc,
      listener: (context, state) {
        if (state.status == Status.success) {
          product = state.productsModel?.products?.first;
        }
        if (state.status == Status.failed) {
          print("error");
        }
      },
      child: BlocBuilder<DataBloc, ProductsState>(
        bloc: dataBloc,
        builder: (context, state) {
          if (state.status == Status.busy || product == null) {
            return Scaffold(
              body: const Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(product?.title ?? 'Product Details'),
            ),
            body: (state.status == Status.busy || product == null)
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Hero(
                            tag: '${product?.id}',
                            child: Image.network(
                              product?.thumbnail ?? '',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (product?.brand != null)
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    product?.brand ?? '',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              Text(
                                product?.title ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product?.description ?? '',
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 16),
                              ),
                              // AnimatedCrossFade(
                              //   firstChild: Text(
                              //     product?.description ?? '',
                              //     maxLines: 3,
                              //     overflow: TextOverflow.ellipsis,
                              //     textAlign: TextAlign.justify,
                              //     style: const TextStyle(fontSize: 16),
                              //   ),
                              //   secondChild: Text(
                              //     product?.description ?? '',
                              //     textAlign: TextAlign.justify,
                              //     style: const TextStyle(fontSize: 16),
                              //   ),
                              //   crossFadeState: showMore
                              //       ? CrossFadeState.showSecond
                              //       : CrossFadeState.showFirst,
                              //   duration: Duration(milliseconds: 300),
                              // ),
                              // SizedBox(height: 5),
                              // GestureDetector(
                              //   onTap: () {
                              //     setState(() {
                              //       showMore = !showMore;
                              //     });
                              //   },
                              //   child: Text(
                              //     showMore ? "See Less" : "See More",
                              //     style: TextStyle(
                              //       color: Colors.blue,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rs. ${product?.price ?? 0}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "(${product?.discountPercentage ?? 0}% OFF)",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade400,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                product?.availabilityStatus ?? "In Stock",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade400,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'Comments By Customers:',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: product?.reviews?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product?.reviews?[index].comment ??
                                              '',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${product?.reviews?[index].reviewerName ?? ''} | ${product?.reviews?[index].reviewerEmail ?? ''}',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
