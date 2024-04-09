import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 可以将这里SafeArea组件删除，以观察效果
        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (_, __) => Text(
              "This is a text",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
