import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flow"),
        ),
        body: Diagonal(
          children: [
            FlutterLogo(size: 50),
            Container(width: 60, height: 180, color: Colors.orange),
            Text("Diagonal"),
            Container(width: 20, height: 260, color: Colors.purple),
            Icon(Icons.circle),
            Container(width: 120, height: 60, color: Colors.teal),
          ],
        ),
      ),
    );
  }
}

class Diagonal extends StatelessWidget {
  final List<Widget> children;

  const Diagonal({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: DiagonalLayout(),
      children: children,
    );
  }
}

class DiagonalLayout extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    Offset offset = Offset.zero;

    for (int i = 0; i < context.childCount; i++) {
      final s = context.getChildSize(i)!;
      context.paintChild(
        i,
        transform: Matrix4.identity()..translate(offset.dx, offset.dy),
      );
      offset += Offset(s.width, s.height);
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}
