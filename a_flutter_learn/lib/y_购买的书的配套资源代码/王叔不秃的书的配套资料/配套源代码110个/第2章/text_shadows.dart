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
        title: Text("文字阴影效果"),
      ),
      body: Text(
        '文字阴影效果',
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
          shadows: [
            BoxShadow(
              offset: Offset(10, 10),
              color: Colors.grey,
              blurRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
