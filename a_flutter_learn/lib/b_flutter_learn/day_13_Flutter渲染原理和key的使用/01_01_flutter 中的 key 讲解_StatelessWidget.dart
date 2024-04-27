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
    logger.e("${LogTag.tag}--build方法调用--$names");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: names.map((name) {
          return ListItemStateLess(
            name,
            key: ValueKey(name),
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

class ListItemStateLess extends StatelessWidget {
  final String name;

  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(250), Random().nextInt(255));

  ListItemStateLess(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: randomColor,
      alignment: Alignment.center,
      child: Text(
        name,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}

/// 问题所在:删除第一个后 重新构建,所有 statelessWidget 就重新构建了,重新构建调用 build 方法, 然后颜色也就变了.
///  不希望 删除第一个后,rebuild 后 颜色也不要改变.? Stateless 是没办法的. 都会调用 build 方法重新创建.
