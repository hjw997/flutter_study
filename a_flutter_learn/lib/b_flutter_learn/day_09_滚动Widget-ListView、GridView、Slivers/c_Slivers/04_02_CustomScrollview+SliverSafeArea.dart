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
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: CustomScrollView(
        slivers: [
          /// 此时看到 列表默认在状态栏下,滚动时候可以穿透到状态栏下.
          SliverSafeArea(
            sliver: SliverGrid(
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
                    mainAxisSpacing: 5)),
          ),
        ],
      ),
    );
  }
}

/// SafeArea  和 SliverSafeArea 区别:
/// SafeArea 是无法在子组件穿透过去.
/// SliverSafeArea 可以让滚动的组件 , 滚动时候穿透到 状态栏下.
