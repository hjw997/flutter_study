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
        title: Text("GestureDetector Demo"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => print("onTap"),
          onTapDown: (TapDownDetails details) =>
              print("onTapDown with ${details.kind}"),
          onTapUp: (TapUpDetails details) =>
              print("onTapUp at ${details.globalPosition}"),
          onTapCancel: () => print("onTapCancel"),
          child: FlutterLogo(size: 200),
        ),
      ),
    );
  }
}
