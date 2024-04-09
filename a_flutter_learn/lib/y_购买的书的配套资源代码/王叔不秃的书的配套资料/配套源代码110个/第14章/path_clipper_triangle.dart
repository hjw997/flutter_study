import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
      body: Center(
        child: ClipPath(
          clipper: TriangleClipper(),
          child: Container(width: 200, height: 80, color: Colors.grey),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    return Path()
      ..moveTo(0.0, size.height) // 移动至矩形左下角作为起点
      ..lineTo(size.width / 2, 0.0) // 绘至矩形顶边的中心位置
      ..lineTo(size.width, size.height) // 绘至矩形的右下角
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
