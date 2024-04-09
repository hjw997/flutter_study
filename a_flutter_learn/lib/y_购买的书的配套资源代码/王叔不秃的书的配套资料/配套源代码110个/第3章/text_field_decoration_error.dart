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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: InputDecoration(
              errorText: null, // 错误提示为空，即无错误状态
              helperText: "Helper Text",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              errorText: "This field cannot be left blank",
              helperText: "Helper Text",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              errorText: "This field cannot be left blank",
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 8.0,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
