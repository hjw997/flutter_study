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
            SliverToBoxAdapter(
              child: FlutterLogo(size: 48),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Text("Sliver Child List A", style: TextStyle(fontSize: 32)),
                  Text("Sliver Child List B", style: TextStyle(fontSize: 32)),
                  Text("Sliver Child List C", style: TextStyle(fontSize: 32)),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) => Text("Sliver Child Builder ${index + 1}"),
                childCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
