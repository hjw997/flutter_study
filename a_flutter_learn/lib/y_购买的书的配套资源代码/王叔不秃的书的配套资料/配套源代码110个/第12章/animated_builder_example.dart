import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("AnimatedBuilder Demo")),
        body: TypeWriter(),
      ),
    );
  }
}

class TypeWriter extends StatefulWidget {
  @override
  _TypeWriterState createState() => _TypeWriterState();
}

class _TypeWriterState extends State<TypeWriter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final message = "lorem ipsum " * 20;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
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
    return Container(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          final count = (message.length * _controller.value).floor();
          final text = message.substring(0, count);
          return Text(
            text,
            style: TextStyle(fontSize: 24),
          );
        },
      ),
    );
  }
}
