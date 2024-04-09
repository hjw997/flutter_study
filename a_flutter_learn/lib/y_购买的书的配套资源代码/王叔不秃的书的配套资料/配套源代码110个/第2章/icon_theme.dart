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
        title: Text("利用IconTheme设置图标的默认样式"),
      ),
      body: IconTheme(
        data: IconThemeData(
          size: 48,
          color: Colors.grey,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.close),
            Icon(
              Icons.arrow_back,
              size: 24,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
