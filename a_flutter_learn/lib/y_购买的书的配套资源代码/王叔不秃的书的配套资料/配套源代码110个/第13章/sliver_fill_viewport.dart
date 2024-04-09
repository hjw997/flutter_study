import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SliverFillViewport Demo"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 16 / 9,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                  color: Colors.primaries[index * 3 % 18],
                  child: Center(child: Text("item ${index + 1}")),
                ),
                childCount: 5,
              ),
            ),
            SliverFillViewport(
              viewportFraction: 0.5,
              padEnds: true, // 可通过padEnds属性关闭首尾的留白
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.grey[400],
                  padding: EdgeInsets.all(48),
                  child: Center(child: Text("第1页")),
                ),
                Container(
                  color: Colors.grey[400],
                  padding: EdgeInsets.all(48),
                  child: Center(child: Text("第2页")),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
