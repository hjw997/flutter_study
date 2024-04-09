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
  final shades = [700, 200, 600, 500, 900, 800];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReorderableListView"),
      ),
      body: ReorderableListView(
        children: shades
            .map((shade) =>
            Container(
              key: ValueKey(shade),
              height: 50,
              margin: EdgeInsets.all(4.0),
              color: Colors.grey[shade],
            ))
            .toList(),
        onReorder: (int oldIndex, int newIndex) {
          if (newIndex > oldIndex) newIndex--;
          setState(() {
            final shade = shades.removeAt(oldIndex);
            shades.insert(newIndex, shade);
          });
        },
      ),
    );
  }
}
