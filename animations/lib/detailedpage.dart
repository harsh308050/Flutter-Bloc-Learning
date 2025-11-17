import 'package:flutter/material.dart';

class Detailedpage extends StatelessWidget {
  const Detailedpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        children: [
          Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://media.istockphoto.com/id/2153573059/photo/mountain-covered-with-a-coniferous-fir-tree-forest-scenic-landscape-from-carpathian-mountains.jpg?s=612x612&w=0&k=20&c=v6knuIrkHfIdKK4Bzdrr2P0C4TSrAQJgIFUPQ5CQpdw=',
              width: 500,
              height: 500,
            ),
          ),
          const SizedBox(width: 20),
          const Text(
            "Welcome to the Homepage",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
