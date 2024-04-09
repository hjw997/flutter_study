import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 100, height: 100, color: Colors.grey),
              Container(width: 100, height: 100, color: Colors.grey),
            ],
          ),
          GridView.extent(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            maxCrossAxisExtent: 80,
            padding: EdgeInsets.all(32),
            mainAxisSpacing: 32,
            crossAxisSpacing: 32,
            children: List.generate(
              100,
                  (index) => Container(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
