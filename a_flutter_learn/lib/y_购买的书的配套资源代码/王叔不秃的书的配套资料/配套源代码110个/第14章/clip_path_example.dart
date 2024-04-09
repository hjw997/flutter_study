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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double dx = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipPath Demo"),
      ),
      body: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanUpdate: (details) {
            setState(() => dx = details.localPosition.dx);
          },
          child: ClipPath(
            clipper: ArcClipper(dx),
            child: Container(width: 200, height: 200, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  final double dx;

  ArcClipper(this.dx);

  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(dx, 0, size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..close();
  }

  @override
  bool shouldReclip(ArcClipper old) => this.dx != old.dx;
}
