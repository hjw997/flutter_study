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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView(
        /// 这个 Delegate 主要为了修饰 grid 的 .
        /// gridDelegate 实现类主要有两个:
        /// 1.FixedCrossAxisCount交叉轴有固定的个数的 item.
        /// 2.SliverGridDelegateWithMaxCrossAxisExtent: 交叉轴上最大宽度,这样根据屏幕大就会有更多的 item.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          /// 交叉轴上有几列
          crossAxisCount: 3,

          /// 主轴和交叉轴上的item 的间距.
          mainAxisSpacing: 8,
          crossAxisSpacing: 10,

          /// item 的大小:
          childAspectRatio: 1.5,
        ),
        children: List.generate(100, (index) {
          return Container(
              width: 50,
              height: 150,
              color: Color.fromARGB(255, Random().nextInt(255),
                  Random().nextInt(250), Random().nextInt(255)),
              alignment: Alignment.center,
              child: Text("index---$index"),
          );
        }),
      ),
    );
  }
}
