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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FractionallySizedBox Demo"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [0.5, 1.5]
            .map((factor) => Container(
          width: 100,
          height: 100,
          color: Colors.grey,
          child: FractionallySizedBox(
            heightFactor: factor,
            widthFactor: factor,
            alignment: Alignment.bottomRight,
            child: FlutterLogo(),
          ),
        ))
            .toList(),
      ),
    );
  }
}
