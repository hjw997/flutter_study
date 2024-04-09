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
        title: Text("RefreshIndicator Styling"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
        },
        color: Colors.white,
        // 颜色：白色
        backgroundColor: Colors.black,
        // 背景色：黑色
        strokeWidth: 4.0,
        // 粗细：4单位
        displacement: 20,
        // 位移：20单位
        child: GridView.count(
          physics: AlwaysScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: List.filled(10, Text("列表的一格")),
        ),
      ),
    );
  }
}
