import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listener Demo'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double x = 0.0, y = 0.0;
  int _upCount = 0;
  int _downCount = 0;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        color: Colors.grey[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '按下$_downCount次\n抬起$_upCount次',
                style: TextStyle(fontSize: 24),
              ),
              Text('坐标：($x, $y)'),
            ],
          ),
        ),
      ),
      onPointerDown: (PointerEvent details) {
        setState(() => _downCount++);
      },
      onPointerMove: (PointerEvent details) {
        setState(() {
          x = details.position.dx;
          y = details.position.dy;
        });
      },
      onPointerUp: (_) => setState(() => _upCount++),
    );
  }
}
