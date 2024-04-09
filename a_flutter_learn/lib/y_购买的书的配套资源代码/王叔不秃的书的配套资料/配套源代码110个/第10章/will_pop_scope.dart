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
      appBar: AppBar(title: Text("Navigator Demo")),
      body: Center(
        child: ElevatedButton(
          child: Text("打开页面"),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => DetailPage()),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator Demo")),
      body: WillPopScope(
        onWillPop: () async {
          final result = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("确认要退出吗？"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("取消"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text("退出"),
                ),
              ],
            ),
          );
          return result ?? false;
        },
        child: BackButton(),
      ),
    );
  }
}
