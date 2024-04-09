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
        title: Text("Button Demo"),
      ),
      body: ElevatedButton.icon(
        icon: Icon(Icons.star),
        label: Text("Click me"),
        onPressed: () => print("用户点击了按钮"),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            // 若按钮处于被点击的状态，则返回红色，否则蓝色
            if (states.contains(MaterialState.pressed)) {
              return Colors.red;
            }
            return Colors.blue;
          }),
          textStyle: MaterialStateProperty.resolveWith((states) {
            // 若按钮处于被点击的状态，则返回40号字，否则20号字
            if (states.contains(MaterialState.pressed)) {
              return TextStyle(fontSize: 40);
            }
            return TextStyle(fontSize: 20);
          }),
        ),
      ),
    );
  }
}
