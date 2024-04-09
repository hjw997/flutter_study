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
        title: Text("Container的间距留白和填充"),
      ),
      body: Container(
        color: Colors.black,
        child: Container(
          width: 100,
          height: 100,
          // 设置“外部”间距留白，左边16个单位，底部8个单位
          margin: EdgeInsets.only(left: 16.0, bottom: 8.0),
          // 设置“内部”填充留白，所有方向16个单位
          padding: EdgeInsets.all(16.0),
          color: Colors.grey,
          alignment: Alignment.topLeft,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
