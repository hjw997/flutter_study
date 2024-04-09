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
        title: Text("FittedBox Demo"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildDemo(Alignment.center, BoxFit.contain),
          _buildDemo(Alignment.topCenter, BoxFit.contain),
          _buildDemo(Alignment.bottomCenter, BoxFit.contain),
          _buildDemo(Alignment.center, BoxFit.cover),
          _buildDemo(Alignment.centerLeft, BoxFit.cover),
          _buildDemo(Alignment.centerRight, BoxFit.cover),
        ],
      ),
    );
  }

  _buildDemo(alignment, fit) {
    return Container(
      width: 50,
      height: 200,
      color: Colors.grey,
      child: FittedBox(
        clipBehavior: Clip.hardEdge,
        alignment: alignment,
        fit: fit,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              FlutterLogo(size: 48),
              Text("Text", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
