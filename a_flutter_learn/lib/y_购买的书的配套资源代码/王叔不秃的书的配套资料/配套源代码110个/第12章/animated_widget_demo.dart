import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("AnimatedWidget Demo")),
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
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 5),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TypeWriterTransition(
      progress: _controller,
      message: "lorem ipsum " * 20,
    );
  }
}

class TypeWriterTransition extends AnimatedWidget {
  final String message;
  final Animation<double> progress;

  const TypeWriterTransition({
    required this.message,
    required this.progress,
  }) : super(listenable: progress);

  @override
  Widget build(BuildContext context) {
    final count = (message.length * progress.value).floor();
    final text = message.substring(0, count);
    return Text(
      text,
      style: TextStyle(fontSize: 24),
    );
  }
}
