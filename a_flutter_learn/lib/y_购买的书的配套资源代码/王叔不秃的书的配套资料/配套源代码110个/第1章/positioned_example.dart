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
        title: Text("Positioned的6个参数的用法展示"),
      ),
      body: Container(
        width: 200,
        height: 200,
        color: Colors.grey[200],
        child: Stack(
          children: [
            Positioned(
              // 左上对齐，利用width和height来设置子组件尺寸
              left: 20,
              top: 20,
              width: 50,
              height: 50,
              child: FlutterLogo(),
            ),
            Positioned(
              // 左下对齐，子组件默认尺寸
              left: 20,
              bottom: 20,
              child: FlutterLogo(),
            ),
            Positioned(
              // 右上对齐，子组件默认尺寸
              right: 20,
              top: 20,
              child: FlutterLogo(),
            ),
            Positioned(
              // 通过同时设置上下左右来约束子组件的尺寸
              left: 100,
              right: 20,
              top: 100,
              bottom: 20,
              child: FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
