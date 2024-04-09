import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("OverflowBox Demo"),
        ),
        body: Column(
          children: [
            FlutterLogo(size: 100),
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRect(
                child: OverflowBox(
                  alignment: Alignment.bottomRight,
                  maxWidth: 200,
                  maxHeight: 200,
                  child: FlutterLogo(size: 200),
                ),
              ),
            ),
            FlutterLogo(size: 100),
          ],
        ),
      ),
    );
  }
}
