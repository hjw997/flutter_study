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
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        /// 相当于有几列.
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 5,
        /// 主轴上 item 的大小.
        mainAxisExtent: 200,
      ),

      /// builder 构造函数, 当某个 item 要在屏幕上显示的时候才来调用这个 创建 builder 的方法.
      itemBuilder: (BuildContext context, int index) {
        return Container(
            width: 50,
            height: 150,
            color: Color.fromARGB(255, Random().nextInt(255),
                Random().nextInt(250), Random().nextInt(255)),
            alignment: Alignment.center,
            child: Text("index---$index"));
      },
    );
  }
}
