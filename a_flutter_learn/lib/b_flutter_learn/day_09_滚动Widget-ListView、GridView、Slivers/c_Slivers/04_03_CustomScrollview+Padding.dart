import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 去掉这个 appBar 列表就会到状态栏下面.
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (ctx, index) {
                    return Container(
                      color: Color.fromARGB(255, Random().nextInt(255),
                          Random().nextInt(250), Random().nextInt(255)),
                      alignment: Alignment.center,
                      child: Text("索引$index"),
                    );
                  },
                  childCount: 100,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5))
          ],
        ),
      ),
    );
  }
}

/// 如果想在滚动组件周边 留 一些 padding ,但是滚动的时候 这个顶部的 padding 要消失 , 先看 Padding 案例.
/// 如果直接加 Padding 给 CustomScrollview 会出现 滚动时候白边 .
/// 解决方法:SliverPadding 看下一个案例.
