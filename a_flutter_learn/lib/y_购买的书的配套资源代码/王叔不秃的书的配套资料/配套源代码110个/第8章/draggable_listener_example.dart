import 'package:flutter/material.dart';
import 'dart:math';

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
  late MaterialColor _color;
  late List<Color> _list;

  @override
  void initState() {
    _generatePuzzle();
    super.initState();
  }

  _generatePuzzle() {
    setState(() {
      final _rnd = Random();
      const allowedColors = Colors.primaries;
      _color = allowedColors[_rnd.nextInt(allowedColors.length)];
      final l1 = [100, 200]..shuffle(_rnd);
      final l2 = [300, 400, 600, 800]..shuffle(_rnd);
      _list = [...l1, ...l2].map((i) => _color[i]!).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Draggable Game Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Drag and drop to rearrange",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            IconButton(
              onPressed: _generatePuzzle,
              icon: Icon(Icons.shuffle),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Container(
                width: ColorBox.boxWidth - ColorBox.boxPadding * 2,
                height: ColorBox.boxHeight - ColorBox.boxPadding * 2,
                decoration: BoxDecoration(
                  color: _color[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
              ),
            ),
            ReorderColors(
              color: _color,
              colorList: _list,
              onSuccess: () => print("Victory!"),
            ),
          ],
        ),
      ),
    );
  }
}

class ReorderColors extends StatefulWidget {
  final MaterialColor color;
  final List<Color> colorList;
  final Function() onSuccess;

  ReorderColors({
    required this.color,
    required this.colorList,
    required this.onSuccess,
  }) : super(key: UniqueKey());

  @override
  _ReorderColorsState createState() => _ReorderColorsState();
}

class _ReorderColorsState extends State<ReorderColors> {
  int _emptySlot = 1;
  double _tapOffset = 0.0;

  @override
  Widget build(BuildContext context) {
    final _list = widget.colorList;
    final h = ColorBox.boxHeight;
    return Container(
      width: ColorBox.boxWidth,
      height: _list.length * h,
      child: Listener(
        onPointerDown: (event) {
          final obj = context.findRenderObject() as RenderBox;
          _tapOffset = obj.globalToLocal(Offset.zero).dy;
        },
        onPointerMove: (event) {
          final y = event.position.dy + _tapOffset;
          if (y > (_emptySlot + 1) * h) {
            if (_emptySlot == _list.length - 1) return;
            Color temp = _list[_emptySlot];
            _list[_emptySlot] = _list[_emptySlot + 1];
            _list[_emptySlot + 1] = temp;
            setState(() => _emptySlot++);
          } else if (y < (_emptySlot) * h - (h / 2)) {
            if (_emptySlot == 0) return;
            Color temp = _list[_emptySlot];
            _list[_emptySlot] = _list[_emptySlot - 1];
            _list[_emptySlot - 1] = temp;
            setState(() => _emptySlot--);
          }
        },
        child: Stack(
          children: List.generate(
            _list.length,
                (i) => ColorBox(
              x: 0,
              y: i * h,
              color: _list[i],
              onDrag: (c) => _emptySlot = _list.indexOf(c),
              onDrop: () {
                final it = _list.map((c) => c.computeLuminance()).iterator
                  ..moveNext();
                var prev = it.current;
                var sorted = true;
                while (it.moveNext()) {
                  if (it.current < prev) {
                    sorted = false;
                    break;
                  }
                  prev = it.current;
                }
                if (sorted) widget.onSuccess();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ColorBox extends StatelessWidget {
  static const boxHeight = 40.0;
  static const boxWidth = 180.0;
  static const boxPadding = 1.0;

  final double x, y; // box position
  final Color color;
  final Function(Color c) onDrag;
  final Function() onDrop;

  ColorBox({
    required this.x,
    required this.y,
    required this.color,
    required this.onDrag,
    required this.onDrop,
  }) : super(key: ValueKey(color));

  @override
  Widget build(BuildContext context) {
    final box = Padding(
      padding: EdgeInsets.all(boxPadding),
      child: Container(
        width: boxWidth - boxPadding * 2,
        height: boxHeight - boxPadding * 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(boxHeight / 5),
        ),
      ),
    );

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      left: x,
      top: y,
      child: Draggable(
        onDragStarted: () => onDrag(color),
        onDragEnd: (_) => onDrop(),
        feedback: box,
        child: box,
        childWhenDragging: SizedBox(width: boxWidth, height: boxHeight),
      ),
    );
  }
}
