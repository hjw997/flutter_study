import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("OverflowBox Demo"),
        ),
        body: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          height: 100, // 将这里的高度修改为0，动画过程中不会出现溢出警告
          color: Colors.grey[200],
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.topCenter,
              maxHeight: 100,
              child: Column(
                children: [
                  Text("Line 1"),
                  Text("Line 2"),
                  Text("Line 3"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
