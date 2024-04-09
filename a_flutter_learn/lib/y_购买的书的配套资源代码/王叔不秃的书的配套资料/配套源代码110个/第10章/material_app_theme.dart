import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey,
        textTheme: TextTheme(
          headline4: TextStyle(
            backgroundColor: Colors.white,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme Demo")),
      body: Center(
        child: Text(
          "This is headline4",
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
