import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chaos Game"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80.0),
                child: Text("该列表滚动时并不流畅"),
              ),
              // 在此处为CustomPaint添加RepaintBoundary可大幅提升性能
              CustomPaint(
                foregroundPainter: ChaosPainter(),
                size: Size.fromHeight(400),
              ),
              ElevatedButton(
                child: Text("点击按钮时也会卡顿"),
                onPressed: () {},
              ),
              Text("为CustomPaint添加RepaintBoundary可大幅提升性能"),
              Placeholder(fallbackHeight: 2000),
            ],
          ),
        ),
      ),
    );
  }
}

class ChaosPainter extends CustomPainter {
  final rand = Random();
  final pen = Paint()..color = Colors.black;

  @override
  void paint(Canvas canvas, Size size) {
    print("painting");
    final anchors = [
      // 定义三角形的3个顶点
      Offset(size.width / 2, 0), // 画布的顶部中间处
      Offset(0, size.height), // 画布的左下角
      Offset(size.width, size.height), // 画布的右下角
    ];

    Offset current = Offset(0, 0);
    for (int i = 0; i < 50000; i++) {
      // 随机选择三角形的其中1个顶点
      final anchor = anchors[rand.nextInt(anchors.length)];
      // 从当前位置向顶点移动一半的距离
      current = (current + anchor) / 2;
      // 在新的位置绘制一个黑色的点（前10个点不必绘制）
      if (i > 10) canvas.drawCircle(current, 1.0, pen);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
