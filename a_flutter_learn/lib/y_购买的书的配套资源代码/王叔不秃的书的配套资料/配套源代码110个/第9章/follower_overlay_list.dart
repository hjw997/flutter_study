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

final _links = {}; // 用于储存link的Map数据类型

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: ListView.builder(
        itemExtent: 50,
        itemBuilder: (_, index) {
          var link;
          // 查找该元素之前保存过的link，否则创建新的link并保存：
          if (_links.containsKey(index)) {
            link = _links[index];
          } else {
            link = LayerLink();
            _links[index] = link;
          }
          return Container(
            color: Colors.primaries[index % 18][200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CompositedTransformTarget(
                  // 目标
                  link: link,
                  child: Text("This is item $index"),
                ),
                ElevatedButton(
                  child: Icon(Icons.more_horiz),
                  onPressed: () {
                    final entry = OverlayEntry(builder: (_) {
                      return CompositedTransformFollower(
                        // 追随者
                        offset: Offset(20, 20), // 位移
                        showWhenUnlinked: false, // 当目标消失时自动隐藏
                        link: link,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      );
                    });
                    Overlay.of(context)?.insert(entry);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
