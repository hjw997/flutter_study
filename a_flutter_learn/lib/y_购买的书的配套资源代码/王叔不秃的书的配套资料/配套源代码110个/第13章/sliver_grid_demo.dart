import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Sliver Demo")),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                  color: Colors.primaries[index * 2 % 18],
                  child: Center(child: Text("item ${index + 1}")),
                ),
                childCount: 12,
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 16 / 9,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 8.0,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                  color: Colors.primaries[index * 2 % 18],
                  child: Center(child: Text("item ${index + 1}")),
                ),
                childCount: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
