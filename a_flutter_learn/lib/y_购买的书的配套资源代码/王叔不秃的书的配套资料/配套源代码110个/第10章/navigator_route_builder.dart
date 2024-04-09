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
    final myPageRoute = PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      reverseTransitionDuration: Duration(milliseconds: 500),
      pageBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          ) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(color: Colors.grey),
        );
      },
      transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
          ) {
        return ScaleTransition(
          scale: animation,
          child: RotationTransition(
            turns: animation,
            child: child,
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: Text("Navigator Demo")),
      body: Center(
        child: ElevatedButton(
          child: Text("旋转打开新页面"),
          onPressed: () {
            Navigator.of(context).push(myPageRoute);
          },
        ),
      ),
    );
  }
}
