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
        title: Text("Gesture Detector Demo"),
      ),
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onTapDown: (_) => print('底层Container按下事件'),
            child: Container(width: 200, height: 200, color: Colors.blue),
          ),
          GestureDetector(
            /* 这里改变behavior属性的值，可观察到3种不同的行为:
             * translucent: 手势可穿透，2枚Container都会接收到事件；
             * opaque: 此顶层Container遮挡了另一个，只有此层的事件会触发；
             * deferToChild:因为子组件透明，无法接收事件，因此只有底层的事件会触发。*/
            behavior: HitTestBehavior.translucent,
            onLongPressStart: (_) => print('顶层Container长按事件'),
            child: Container(width: 200, height: 200),
          ),
        ],
      ),
    );
  }
}
