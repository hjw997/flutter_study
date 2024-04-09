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
          shaderCallback: (Rect bounds) => LinearGradient(
            begin: Alignment(-1, 0),
            end: Alignment(-0.9, 0),
            colors: <Color>[Colors.black, Colors.white],
            tileMode: TileMode.repeated,
          ).createShader(bounds),
          child: Text(
            "斑马效果",
            style: TextStyle(color: Colors.white, fontSize: 80),
          ),
        ),
      ),
    );
  }
}
