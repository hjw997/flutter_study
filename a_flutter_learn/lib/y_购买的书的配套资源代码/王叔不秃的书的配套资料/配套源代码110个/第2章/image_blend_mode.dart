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
        title: Text("运行时需自备owl.jpg图片文件"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/owl.jpg",
            height: 200,
            width: 200,
            color: Colors.white,
            colorBlendMode: BlendMode.softLight,
          ),
          Image.asset(
            "images/owl.jpg",
            height: 200,
            width: 200,
            color: Colors.black,
            colorBlendMode: BlendMode.softLight,
          ),
        ],
      ),
    );
  }
}
