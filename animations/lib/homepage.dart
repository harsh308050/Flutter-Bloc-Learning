import 'package:animations/detailedpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Detailedpage()),
                );
              },
              child: Row(
                children: [
                  Hero(
                    tag: 'imageHero',
                    child: Image.network(
                      'https://media.istockphoto.com/id/2153573059/photo/mountain-covered-with-a-coniferous-fir-tree-forest-scenic-landscape-from-carpathian-mountains.jpg?s=612x612&w=0&k=20&c=v6knuIrkHfIdKK4Bzdrr2P0C4TSrAQJgIFUPQ5CQpdw=',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Welcome to the Homepage",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: expanded ? 200 : 100,
                  height: 100,
                  color: Colors.blue,
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  child: const Text("Toggle"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Column(
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 200,
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          "First",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      icon: Icon(
                        expanded ? Icons.expand_less : Icons.expand_more,
                      ),
                    ),
                  ],
                ),

                AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  child: expanded
                      ? Column(
                          children: [
                            Container(
                              color: Colors.green,
                              width: 200,
                              height: 100,
                              child: Text("data1"),
                            ),
                            Container(
                              color: Colors.blue,
                              width: 200,
                              height: 100,
                              child: Text("data1"),
                            ),
                            Container(
                              color: Colors.brown,
                              width: 200,
                              height: 100,
                              child: Text("data1"),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
              ],
            ),

            Visibility(
              visible: expanded ? true : false,
              child: Container(
                height: 100,
                width: 200,
                color: Colors.yellow,
                child: Text("data"),
              ),
            ),
            Opacity(
              opacity: expanded ? 0.5 : 1,
              child: Container(
                height: 100,
                width: 200,
                color: Colors.blue,
                child: Text("data"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
