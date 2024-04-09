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
        title: Text("LinearProgressIndicator Demo"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: LinearProgressIndicator(value: 0.12),
          ),
          RotatedBox(
            quarterTurns: -1,
            child: LinearProgressIndicator(
              value: 0.42,
              valueColor: AlwaysStoppedAnimation(Colors.black),
              backgroundColor: Colors.transparent,
            ),
          ),
          RotatedBox(
            quarterTurns: -1,
            child: LinearProgressIndicator(
              minHeight: 20,
              value: 0.89,
              valueColor: AlwaysStoppedAnimation(Colors.black),
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
