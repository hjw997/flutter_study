import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flow Example"),
        ),
        body: MyFlowMenu(
          items: [
            Icons.person,
            Icons.email,
            Icons.phone,
            Icons.delete,
          ].map((icon) {
            return FloatingActionButton(
              child: Icon(icon),
              onPressed: () {},
            );
          }).toList(),
        ),
      ),
    );
  }
}

class MyFlowMenu extends StatefulWidget {
  final List<Widget> items;

  const MyFlowMenu({Key? key, required this.items}) : super(key: key);

  _MyFlowMenuState createState() => _MyFlowMenuState();
}

class _MyFlowMenuState extends State<MyFlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _open = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: MyDelegate(animation: _controller),
      children: [
        FloatingActionButton(
          child: Icon(_open ? Icons.close : Icons.menu),
          onPressed: () {
            if (_open) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
            setState(() => _open = !_open);
          },
        ),
        ...widget.items,
      ],
    );
  }
}

class MyDelegate extends FlowDelegate {
  final Animation<double> animation;

  MyDelegate({required this.animation}) : super(repaint: animation);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    const gap = 4.0;
    double dx = 0.0;
    for (int i = context.childCount - 1; i >= 0; i--) {
      dx = (context.getChildSize(i)!.width + gap) * i;
      context.paintChild(
        i,
        transform: Matrix4.identity()..translate(dx * animation.value),
      );
    }
  }

  @override
  bool shouldRepaint(MyDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
