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
        title: Text("ReorderableList"),
      ),
      body: ReorderableList(
        itemCount: shades.length,
        itemBuilder: (BuildContext context, int index) {
          return ReorderableDragStartListener(
            key: ValueKey(shades[index]),
            index: index,
            child: Container(
              height: 50,
              margin: EdgeInsets.all(4.0),
              color: Colors.grey[shades[index]],
            ),
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          if (newIndex > oldIndex) newIndex--;
          setState(() {
            final shade = shades.removeAt(oldIndex);
            shades.insert(newIndex, shade);
          });
        },
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
