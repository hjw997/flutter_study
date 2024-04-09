import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: MyPainter(_controller),
    );
  }
}

class MyPainter extends CustomPainter {
  static final whitePaint = Paint()..color = Colors.white;
  static List<SnowFlake> snowflakes =
  List.generate(100, (index) => SnowFlake());

  // 将动画控制器传给父类
  MyPainter(Listenable controller) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 绘制渐变的蓝色背景
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.blue, Colors.lightBlue, Colors.white],
        stops: [0, 0.7, 0.95],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, gradientPaint);

    // 绘制文字
    final textSpan = TextSpan(
      text: "Do you wanna build a snowman?",
      style: TextStyle(fontSize: 30, color: Colors.white),
    );
    TextPainter(text: textSpan, textDirection: TextDirection.ltr)
      ..layout(maxWidth: w * 0.5)
      ..paint(canvas, Offset(50, 100));

    // 绘制雪人
    canvas.save();
    final side = size.shortestSide;
    canvas.translate(
      w > h ? w - side : 0,
      h > w ? h - side : 0,
    );
    canvas.drawOval(
      Rect.fromLTRB(side * 0.25, side * 0.4, side * 0.75, side),
      whitePaint,
    );
    canvas.drawCircle(Offset(side * 0.5, side * 0.3), side * 0.18, whitePaint);
    canvas.restore();

    // 绘制雪花
    snowflakes.forEach((snow) {
      snow.fall();
      canvas.drawCircle(
        Offset(snow.x * w, snow.y * h),
        snow.radius,
        whitePaint,
      );
    });
  }

  @override
  bool shouldRepaint(_) => false;
}

class SnowFlake {
  final Random rnd = Random();
  late double x, y, radius, velocity;

  SnowFlake() {
    reset();
    y = rnd.nextDouble();
  }

  reset() {
    x = rnd.nextDouble();
    y = 0;
    radius = (rnd.nextDouble() * 2 + 2);
    velocity = (rnd.nextDouble() * 4 + 2) / 2000;
  }

  fall() {
    y += velocity;
    if (y > 1.0) reset();
  }
}
