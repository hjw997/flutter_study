/// flutter 中的屏幕适配 --看笔记
///

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
    return Center(
      child: Container(
        color: Colors.amber,
        /// 面向 point 开发, 也叫-逻辑分辨率 如 iPhone6 4.7英寸 对角线长度.
        /// 以 iPhone 6 为例子:  逻辑宽高 : w:375pt  ,height = 667pt ,
        /// 因为是 Retain 屏幕, 所以设备像素比(Devicepixelratio:dpi)是 2. 也就是一个点宽 2 个像素, 高 2 个像素.
        /// 对应像素就是: 一个点 宽:2 个像素,高 2 个像素, 物理宽度也就是-像素宽:375 * 2 = 750,高:667*2 = 1334 像素.
        child: const Text("屏幕适配相关--"),
      ),
    );
  }
}