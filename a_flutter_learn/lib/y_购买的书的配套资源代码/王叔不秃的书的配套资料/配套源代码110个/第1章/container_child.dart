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
        title: Text("用Container嵌套的形式修饰其他组件"),
      ),
      body: Container(
        width: 200,
        height: 100,
        color: Colors.grey,
        // 最外的灰色Container
        alignment: Alignment.topLeft,
        // 子组件对齐方式：左上
        child: Container(
          width: 120,
          height: 80,
          color: Colors.black,
          // 中间层的黑色Container
          alignment: Alignment.bottomCenter,
          // 子组件对齐方式：中下
          child: Container(
            width: 20,
            height: 40,
            color: Colors.white, // 最小的白色Container
          ),
        ),
      ),
    );
  }
}
