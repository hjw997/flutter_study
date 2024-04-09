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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transform在布局完成后才发生"),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(width: 200, height: 200, color: Colors.grey[400]),
            Positioned(
              right: 0,
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("Rotated Box"),
              ),
            ),
            Positioned(
              right: 0,
              child: Transform.rotate(
                angle: 3.14 / 2,
                child: Text("Transform.rotate"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
