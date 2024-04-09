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
        title: Text("运行时需自备button.png图片文件"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/button.png",
            height: 100,
            width: 350,
            centerSlice: Rect.fromLTRB(15, 15, 35, 35),
          ),
          Image.asset(
            "images/button.png",
            height: 100,
            width: 350,
            fit: BoxFit.fill, // 普通拉伸
          ),
        ],
      ),
    );
  }
}
