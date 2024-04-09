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
        title: Text("Container的背景修饰与前景修饰"),
      ),
      body: Container(
        width: 100,
        height: 100,
        // 背景修饰
        decoration: BoxDecoration(
          // 从左到右，由黑色到灰色的渐变色
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey],
          ),
          // 模糊阴影
          boxShadow: [BoxShadow(blurRadius: 10)],
        ),
        // 子组件居中对齐
        alignment: Alignment.center,
        // 子组件，白色正方形
        child: Container(
          color: Colors.white,
          width: 50,
          height: 50,
        ),
        // 前景修饰
        foregroundDecoration: BoxDecoration(
          // 半透明的灰色
          color: Colors.grey.withOpacity(0.5),
          // 圆形
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
