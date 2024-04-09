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
        title: Text("默认样式与单独设置的样式合并"),
      ),
      body: DefaultTextStyle(
        // 默认文本样式
        style: TextStyle(
          color: Colors.grey, // 灰色
          fontWeight: FontWeight.bold, // 粗体
        ),
        textAlign: TextAlign.center, // 居中对齐
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("明月几时有"),
            Text("把酒问青天"),
            Text(
              "不知天上宫阙",
              style: TextStyle(
                // 单独设置样式
                color: Colors.black, // 黑色
                fontStyle: FontStyle.italic, // 斜体
              ),
            ),
            Text("今夕是何年"),
          ],
        ),
      ),
    );
  }
}
