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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "images/owl.jpg",
            height: 300,
            width: 100,
            fit: BoxFit.fill,
          ),
          Container(
            color: Colors.grey,
            child: Image.asset(
              "images/owl.jpg",
              height: 300,
              width: 100,
              fit: BoxFit.contain,
            ),
          ),
          Image.asset(
            "images/owl.jpg",
            height: 300,
            width: 100,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
