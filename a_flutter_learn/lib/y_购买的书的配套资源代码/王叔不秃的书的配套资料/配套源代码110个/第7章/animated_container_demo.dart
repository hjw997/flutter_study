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
        title: Text("AnimatedContainer Demo"),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500), // 动画时长500 ms
        width: 200, // 程序运行时，手动将这里修改为300，热重启观察效果
        height: 200,
        color: Colors.blue,
      ),
    );
  }
}
