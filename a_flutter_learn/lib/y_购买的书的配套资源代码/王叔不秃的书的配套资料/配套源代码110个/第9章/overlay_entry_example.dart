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
  OverlayEntry? _entry;
  double _left = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OverlayEntry Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: Text("添加"),
              onPressed: () {
                _entry = OverlayEntry(
                  builder: (context) {
                    print("build");
                    return Positioned(
                      left: _left,
                      top: 200,
                      child: Container(
                        width: 150,
                        height: 150,
                        color: Colors.grey,
                      ),
                    );
                  },
                );
                Overlay.of(context)?.insert(_entry!);
              },
            ),
            ElevatedButton(
              child: Text("移动"),
              onPressed: () {
                _left += 10;
                _entry?.markNeedsBuild();
              },
            ),
            ElevatedButton(
              child: Text("删除"),
              onPressed: () => _entry?.remove(),
            ),
          ],
        ),
      ),
    );
  }
}
