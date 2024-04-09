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
          title: Text("CustomMultiChildLayout"),
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
    return CustomMultiChildLayout(
      delegate: DiagonalLayout(),
      children: [
        for (int i = 0; i < children.length; i++)
          LayoutId(
            id: i,
            child: children[i],
          ),
      ],
    );
  }
}

class DiagonalLayout extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Offset offset = Offset.zero;
    for (int i = 0;; i++) {
      if (hasChild(i)) {
        final childSize = layoutChild(i, BoxConstraints.loose(size));
        positionChild(i, offset);
        offset += Offset(childSize.width, childSize.height);
      } else {
        break;
      }
    }
  }

  @override
  bool shouldRelayout(_) => false;
}
