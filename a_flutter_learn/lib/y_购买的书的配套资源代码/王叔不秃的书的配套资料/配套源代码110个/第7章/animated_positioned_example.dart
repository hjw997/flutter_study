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
  bool _shrink = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPositioned Demo"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: _shrink ? 300 : 150,
            bottom: _shrink ? 400 : 200,
            left: _shrink ? 100 : 50,
            right: _shrink ? 100 : 180,
            child: Container(color: Colors.grey),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: ElevatedButton(
              child: Text("Transform"),
              onPressed: () {
                setState(() => _shrink = !_shrink);
              },
            ),
          ),
        ],
      ),
    );
  }
}
