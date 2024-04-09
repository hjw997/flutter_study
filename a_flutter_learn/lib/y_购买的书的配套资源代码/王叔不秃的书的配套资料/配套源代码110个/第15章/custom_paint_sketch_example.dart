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
          title: Text("Sketch"),
        ),
        body: SketchPad(),
      ),
    );
  }
}

class SketchPad extends StatefulWidget {
  @override
  _SketchPadState createState() => _SketchPadState();
}

class _SketchPadState extends State<SketchPad> {
  final List<Offset?> points = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() => points.add(details.localPosition));
      },
      onPanEnd: (details) {
        setState(() => points.add(null));
      },
      child: CustomPaint(
        foregroundPainter: SketchPainter(points),
        child: Container(color: Colors.yellow[100]),
      ),
    );
  }
}

class SketchPainter extends CustomPainter {
  final List<Offset?> points;

  SketchPainter(this.points);

  static final pen = Paint()
    ..color = Colors.black
    ..strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, pen);
      }
    }
  }

  @override
  bool shouldRepaint(_) => true;
}
