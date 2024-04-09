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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ColorfulIndicator Example"),
      ),
      body: Center(child: ColorfulIndicator()),
    );
  }
}

class ColorfulIndicator extends StatefulWidget {
  @override
  _ColorfulIndicatorState createState() => _ColorfulIndicatorState();
}

class _ColorfulIndicatorState extends State<ColorfulIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: ColorTween(
        begin: Colors.red,
        end: Colors.blue,
      ).animate(_controller),
    );
  }
}
