import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("基础组件"),
      ),
      body: const HYHomeContent(),
    );
  }
}

/// stful 快捷键 生成:StatefulWidget
class HYHomeContent extends StatefulWidget {
  const HYHomeContent({super.key});

  @override
  HYHomeContentState createState() => HYHomeContentState();
}

class HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    ///GridView.count 构造方法相当于: gridDelegate = SliverGridDelegateWithFixedCrossAxisCount
    /// 交叉轴上有固定个数的 Delegate 的
    ///
    /// 所以同理 如果 构造函数如果是 GridView.extent 就相当于 gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent
    /// 所以 必传就是 maxCrossAxisExtent: 交叉轴上最大宽度.
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(100, (index) {
      return Container(
          width: 50,
          height: 150,
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(250), Random().nextInt(255)),
          alignment: Alignment.center,
          child: Text(
            ("index---$index"),
          ));
    }),
    );
  }
}
