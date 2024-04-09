import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  GlobalKey _globalKey = GlobalKey();
  var _bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screenshot Example")),
      body: Column(
        children: [
          // 需要被截图的区域
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [Colors.white, Colors.grey],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(),
                  Text("screenshot me"),
                ],
              ),
            ),
          ),
          // 截图按钮
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () async {
              final render = (_globalKey.currentContext!.findRenderObject()
              as RenderRepaintBoundary);
              final imageBytes = (await (await render.toImage())
                  .toByteData(format: ImageByteFormat.png))!
                  .buffer
                  .asUint8List();
              setState(() {
                _bytes = imageBytes;
              });
            },
          ),
          // 显示截图
          if (_bytes != null) Image.memory(_bytes, width: 200),
        ],
      ),
    );
  }
}
