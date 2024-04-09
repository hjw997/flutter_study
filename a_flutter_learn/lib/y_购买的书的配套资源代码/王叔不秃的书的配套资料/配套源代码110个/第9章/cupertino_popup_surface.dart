import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CupertinoPopupSurface Demo")),
      body: Align(
        alignment: Alignment(0, 0.5),
        child: ElevatedButton(
          child: Text("弹出对话框"),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (_) => Center(
                child: CupertinoPopupSurface(
                  child: FlutterLogo(size: 200),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
