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
        title: Text("Flexible Example"),
      ),
      body: Container(
        decoration: BoxDecoration(
          //制作背景的纹理
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: List.generate(
                  150, (index) => index % 2 == 0 ? Colors.grey : Colors.white)),
        ),
        child: Row(
          children: [
            Flexible(
              // 第1枚组件
              flex: 2,
              child: Container(height: 24, width: 24, color: Colors.grey[600]),
            ),
            Expanded(
              // 第2枚组件
              flex: 1,
              child: Container(height: 24, color: Colors.grey[400]),
            ),
            Expanded(
              // 第3枚组件
              flex: 1,
              child: Container(height: 24, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }

  _buildDemo(alignment, fit) {
    return Container(
      width: 50,
      height: 200,
      color: Colors.grey,
      child: FittedBox(
        clipBehavior: Clip.hardEdge,
        alignment: alignment,
        fit: fit,
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              FlutterLogo(size: 48),
              Text("Text", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
