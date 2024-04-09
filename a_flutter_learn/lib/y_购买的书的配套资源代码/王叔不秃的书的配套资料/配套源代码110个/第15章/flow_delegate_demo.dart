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
          title: Text("Flow"),
        ),
        body: Flow(
          delegate: MyDelegate(),
          children: [
            FlutterLogo(size: 48),
            FlutterLogo(size: 48),
          ],
        ),
      ),
    );
  }
}

class MyDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final size0 = context.getChildSize(0)!; // 查询第1枚child的尺寸
    final size1 = context.getChildSize(1)!; // 查询第2枚child的尺寸

    context.paintChild(0); // 直接渲染第1枚child，不添加特效
    context.paintChild(
      // 渲染第2枚child：
      1,
      transform: Matrix4.identity() // 使用矩阵进行平移旋转和缩放
        ..translate(size0.width, size0.height)
        ..rotateZ(3.14 / 4)
        ..scale(2.0),
      opacity: 0.5, // 修改不透明度
    );
  }

  @override
  bool shouldRepaint(_) => false;
}
