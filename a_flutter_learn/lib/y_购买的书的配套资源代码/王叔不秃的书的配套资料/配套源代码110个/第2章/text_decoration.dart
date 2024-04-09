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
        title: Text("文本修饰线条的渲染效果"),
      ),
      body: Column(
        children: [
          Text(
            "这是一行被划掉的文字",
            style: TextStyle(
              decoration: TextDecoration.lineThrough, // 划掉
              decorationStyle: TextDecorationStyle.solid, // 实线
              decorationColor: Colors.black, // 黑色
              decorationThickness: 4, // 粗细为4单位
            ),
          ),
          Text(
            "一行有下划波浪线的文字",
            style: TextStyle(
              decoration: TextDecoration.underline, // 下划线
              decorationStyle: TextDecorationStyle.wavy, // 波浪线
              decorationColor: Colors.grey[600], // 深灰色
              decorationThickness: 2, // 粗细为2单位
            ),
          ),
        ],
      ),
    );
  }
}
