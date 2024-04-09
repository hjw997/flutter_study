import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedModalBarrier Demo")),
      body: Align(
        alignment: Alignment(0, 0.5),
        child: ElevatedButton(
          child: Text("弹出对话框"),
          onPressed: () async {
            final result = await showDialog(
              barrierColor: Colors.transparent,
              useSafeArea: false,
              context: context,
              builder: (_) => MyBarrier(),
            );
            print(result);
          },
        ),
      ),
    );
  }
}

class MyBarrier extends StatefulWidget {
  @override
  _MyBarrierState createState() => _MyBarrierState();
}

class _MyBarrierState extends State<MyBarrier>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedModalBarrier(
          dismissible: false,
          color: ColorTween(
            begin: Colors.red,
            end: Colors.yellow,
          ).animate(_controller),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop("点击了屏障"),
        ),
        AlertDialog(
          title: Text("对话框"),
          content: Text("这个对话框的屏障的颜色一直在变！"),
          actions: [
            TextButton(
              child: Text("关闭"),
              onPressed: () => Navigator.of(context).pop("点击了关闭"),
            )
          ],
        )
      ],
    );
  }
}
