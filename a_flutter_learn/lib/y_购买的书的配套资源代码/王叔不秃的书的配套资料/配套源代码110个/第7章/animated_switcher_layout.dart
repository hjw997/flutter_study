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
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcher Demo"),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 3),
              child: Text(
                "$_count",
                key: ValueKey(_count),
              ),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: animation,
                  child: child,
                );
              },
              layoutBuilder: (currentChild, previousChildren) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (currentChild != null) currentChild,
                    ...previousChildren,
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: Icon(Icons.plus_one),
              onPressed: () => setState(() => _count++),
            ),
          ],
        ),
      ),
    );
  }
}
