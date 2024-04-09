import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView演示"),
        ),
        body: ListView.builder(
          itemCount: 30,
          itemExtent: 80,
          itemBuilder: (context, index) {
            return Center(child: Counter(index));
          },
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final int index;

  Counter(this.index);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("第${widget.index + 1}枚计数器：$_count"),
      onPressed: () => setState(() => _count++),
    );
  }
}
