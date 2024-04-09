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
        title: Text("TextField Demo"),
      ),
      body: Column(
        children: [
          TextField(
            maxLength: 80,
          ),
          TextField(
            maxLength: TextField.noMaxLength,
          ),
          TextField(
            maxLength: 80,
            buildCounter: (BuildContext context, {
              required int currentLength,
              required int? maxLength,
              required bool isFocused,
            }) {
              return Text('${maxLength! - currentLength}');
            },
          ),
        ],
      ),
    );
  }
}
