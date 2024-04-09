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
  double _initialSize = 200.0;
  double _size = 200.0;
  double _initialAngle = 0.0;
  double _angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Detector Demo"),
      ),
      body: GestureDetector(
        onScaleStart: (_) {
          _initialSize = _size;
          _initialAngle = _angle;
        },
        onScaleUpdate: (ScaleUpdateDetails details) {
          print("scale: ${details.scale}, rotation: ${details.rotation}");
          setState(() {
            _size = _initialSize * details.scale;
            _angle = _initialAngle + details.rotation;
          });
        },
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: _angle,
            child: Icon(Icons.cloud, size: _size),
          ),
        ),
      ),
    );
  }
}
