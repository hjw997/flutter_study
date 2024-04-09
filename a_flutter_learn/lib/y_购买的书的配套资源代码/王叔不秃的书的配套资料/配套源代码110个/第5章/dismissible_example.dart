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
        title: Text("Dismissible Demo"),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => Dismissible(
          key: UniqueKey(),
          background: Container(
            padding: EdgeInsets.all(16),
            color: Colors.black,
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
          secondaryBackground: Container(
            padding: EdgeInsets.all(16),
            color: Colors.grey,
            alignment: Alignment.centerRight,
            child: Icon(Icons.sms),
          ),
          child: Container(
            height: 56,
            alignment: Alignment.center,
            child: Text("这是第${index + 1}项"),
          ),
        ),
      ),
    );
  }
}
