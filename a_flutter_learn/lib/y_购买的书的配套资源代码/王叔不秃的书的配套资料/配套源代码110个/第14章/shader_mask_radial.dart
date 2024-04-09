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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) => RadialGradient(
            radius: 0.7,
            center: Alignment(0.2, 0.7),
            colors: <Color>[
              Colors.indigo,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.orange,
              Colors.red,
            ],
          ).createShader(bounds),
          child: FlutterLogo(size: 128),
        ),
      ),
    );
  }
}
