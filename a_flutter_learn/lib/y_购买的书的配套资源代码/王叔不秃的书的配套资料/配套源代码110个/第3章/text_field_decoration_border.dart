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
              border: UnderlineInputBorder(),
              helperText: "UnderlineInputBorder",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              helperText: "OutlineInputBorder",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              helperText: "InputBorder.none",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(48),
                borderSide: BorderSide(
                  width: 8.0,
                  color: Colors.black,
                ),
              ),
              helperText: "width: 8.0, black",
            ),
          ),
        ],
      ),
    );
  }
}
