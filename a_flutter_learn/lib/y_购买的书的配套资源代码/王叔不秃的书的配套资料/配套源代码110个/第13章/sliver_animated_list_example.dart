import 'dart:math';
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
  final _globalKey = GlobalKey<SliverAnimatedListState>();
  final List<MaterialColor> _items = [Colors.red, Colors.green, Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text("SliverAnimatedList Demo")),
          SliverAnimatedList(
            key: _globalKey,
            initialItemCount: _items.length,
            itemBuilder: (context, int index, Animation<double> animation) {
              final item = Container(
                height: 100,
                color: _items[index][200],
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text("删除"),
                  onPressed: () => _removeItem(index),
                ),
              );
              // 设置数据插入时的动画效果
              return SizeTransition(
                sizeFactor: animation,
                child: item,
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: Icon(Icons.add),
      ),
    );
  }

  _addItem() {
    // 随机生成一种颜色并插入至数据列表的起始位置
    final index = Random().nextInt(Colors.primaries.length);
    final color = Colors.primaries[index];
    _items.insert(0, color);
    // 通知组件状态，在0的位置有数据插入
    _globalKey.currentState!.insertItem(0);
  }

  _removeItem(int index) {
    // 删除数据列表中相应位置的数据
    final color = _items.removeAt(index);
    // 通知组件状态，并设置数据删除时的动画效果
    _globalKey.currentState!.removeItem(
      index,
          (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: Container(
          height: 100,
          color: color[200],
        ),
      ),
    );
  }
}
