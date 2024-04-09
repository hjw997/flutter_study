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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertDialog Demo")),
      body: Align(
        alignment: Alignment(0, 0.5),
        child: ElevatedButton(
          child: Text("弹出对话框"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return MyDialog("标题作为参数传入");
              },
            );
          },
        ),
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  final String title;

  const MyDialog(this.title);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text("内容直接写在build方法中，支持热更新。"),
    );
  }
}
