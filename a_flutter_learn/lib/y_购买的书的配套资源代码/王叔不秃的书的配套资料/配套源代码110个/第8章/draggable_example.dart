import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Draggable Demo'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 400; i < 900; i += 100)
                Draggable(
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[i],
                  ),
                  feedback: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[i],
                  ),
                  childWhenDragging: Container(
                    width: 50,
                    height: 50,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
