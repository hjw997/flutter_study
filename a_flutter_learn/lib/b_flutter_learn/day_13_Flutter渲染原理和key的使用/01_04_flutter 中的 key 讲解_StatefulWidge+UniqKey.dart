///
///
/// 1h44 分开始讲 key .

import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/logger_config.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key 原理',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Key 的作用'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  /// Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List names = ["aaaa", "bbb", "cccc"];

  @override
  Widget build(BuildContext context) {
    logger.e("${LogTag.tag}--_MyHomePageState_build方法调用--$names");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: names.map((name) {
          return ListItemStatefulWidget(
            name,

            /// -------每次使用 不同的 Key 在 build 时候. 这样 在 canUpdate 判断中 得到 false ,重新创建 Element
            /// 有强制刷新 Element-Tree 的功效.
            key: UniqueKey(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            /// setState内部:  _element!.markNeedsBuild();  标记为需要重新构建
            names.removeAt(0);
          });
        },
        tooltip: '删除',
        child: const Icon(
          Icons.delete,
          color: Colors.deepOrange,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListItemStatefulWidget extends StatefulWidget {
  final String name;

  ListItemStatefulWidget(this.name, {super.key});

  @override
  State<ListItemStatefulWidget> createState() {
    /// 打印发现这里的 state 再数据删除后,会来调用创建 State.所以颜色也会继续变化.

    logger.e("${LogTag.tag}--createState方法调用--");
    return _ListItemStatefulState();
  }
}

class _ListItemStatefulState extends State<ListItemStatefulWidget> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(250), Random().nextInt(255));

  @override
  Widget build(BuildContext context) {
    logger.e("${LogTag.tag}--build方法调用--${widget.name}");
    return Container(
      color: randomColor,
      alignment: Alignment.center,
      child: Text(
        widget.name,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}

/// 如果每次的 Key 都不一样 就会 每次重新创建 Element , 然后重新创建 StatefulWidget 的 createState
/// 这里如何搞一个 每次不一样的 Key, 使用随机数做 Key,但是随机数有可能重复 保险的 使用
