import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DragTarget Demo'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> _currentColors = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DragTarget<Color>(
          builder: (context, List<dynamic> candidateData,
              List<dynamic> rejectedData) {
            return Container(
              width: 100,
              height: 100,
              color: candidateData.isNotEmpty
                  ? candidateData.first!.withOpacity(0.5)
                  : getMixedColor(),
            );
          },
          onWillAccept: (Color? value) => value != null,
          onAccept: (Color value) {
            _currentColors.add(value);
          },
        ),
        const SizedBox(height: 24),
        Wrap(
          children: [
            for (int i = 0; i < 18; i++)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Draggable<Color>(
                  data: Colors.primaries[i],
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.primaries[i],
                  ),
                  feedback: Container(
                    width: 50,
                    height: 50,
                    color: Colors.primaries[i],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Color getMixedColor() {
    if (_currentColors.isEmpty) return Colors.grey;
    int r = 0, g = 0, b = 0;
    _currentColors.forEach((color) {
      r += color.red;
      g += color.green;
      b += color.blue;
    });
    final count = _currentColors.length;
    return Color.fromARGB(255, r ~/ count, g ~/ count, b ~/ count);
  }
}
