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
        title: Text("默认样式与父级样式合并"),
      ),
      body: DefaultTextStyle(
        style: TextStyle(
          color: Colors.grey,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        child: Column(
          children: <Widget>[
            // 不使用合并：定义样式为黑色斜体
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
              child: Text("落霞与孤鹜齐飞"),
            ),
            // 使用合并：定义样式为黑色斜体
            DefaultTextStyle.merge(
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
              child: Text("秋水共长天一色"),
            ),
          ],
        ),
      ),
    );
  }
}
