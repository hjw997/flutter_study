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
  bool _round = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _round ? 200 : 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(_round ? 100 : 0),
                boxShadow:
                _round ? [BoxShadow(spreadRadius: 8, blurRadius: 8)] : null,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: const Text("Change Shape"),
              onPressed: () {
                setState(() {
                  _round = !_round;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
