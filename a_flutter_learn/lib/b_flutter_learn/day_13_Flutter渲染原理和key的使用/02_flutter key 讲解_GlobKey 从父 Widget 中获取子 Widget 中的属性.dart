///
///
/// 1h44 分开始讲 key .

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
  ///✅  GlobalKey 泛型是 State类型.
  final GlobalKey<_HYHomeContentState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      /// 然后可以吧这个 globalKey 传入到要获取数据的 StatefulWidget. ✅
      body: HYHomeContent(content: "哈哈哈哈~~~", key: globalKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logger.e(
              "${LogTag.tag}--子 Widget 的 content= ${globalKey.currentState?.widget.content}");
          logger.e(
              "${LogTag.tag}--子 Widget 的 widget= ${globalKey.currentState?.widget}");

          /// 还可以调用方法:
          globalKey.currentState?.test();
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

class HYHomeContent extends StatefulWidget {
  final String content;
  const HYHomeContent({super.key, required this.content});

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        widget.content,
        style: const TextStyle(fontSize: 20, color: Colors.red),
      ),
    );
  }

  void test() {
    logger.e("${LogTag.tag}--test方法调用--");
  }
}
