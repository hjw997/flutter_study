/// 获取屏幕的信息相关
///
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/logger_config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    /// app 一启动 就想要获取 屏幕的信息:
    /// 1.拿到手机的物理分辨率
    logger.i("${LogTag.tag}----${window.physicalSize}");
    logger.i("${LogTag.tag}---View.of:${View.of(context).physicalSize}");

    /// 2.获取屏幕大小(逻辑分辨率 pt)--❌ 如果这里拿报错 就等 context 建好后再拿.
    /// 老版本这里 获取会报错. 因为还没创建好.真想拿就使用 window
    logger.d("${LogTag.tag}----屏幕宽度:${MediaQuery.of(context).size.width}pt");
    logger.d("${LogTag.tag}----屏幕高度:${MediaQuery.of(context).size.height}pt");

    /// 3. window 拿 (源码中初始化: window.physicalSize / window.devicePixelRatio )
    logger.d("${LogTag.tag}----window size: ${window.physicalSize / window.devicePixelRatio}");
    final dpr = window.devicePixelRatio;
    final height = window.physicalSize.height / dpr;
    final width = window.physicalSize.width / dpr;
    logger.d("${LogTag.tag}----宽高是:$width * $height");

    /// 状态栏 底部安全区域 等 都可以 使用 padding.top padding.bottom
    logger.d("${LogTag.tag}----top:${MediaQuery.of(context).padding.top}");
    logger.d("${LogTag.tag}----bottom:${MediaQuery.of(context).padding.bottom}");

    /// PS 使用 window.padding 这样拿是物理像素,所以 pt 就要除以 物理宽高/ dpr 就是 pt.
    logger.d("${LogTag.tag}----top:${window.padding.top}");
    logger.d("${LogTag.tag}----bottom:${window.padding.bottom}");

    ///这么常用的 获取 信息的 可以直接封装 : size_fit


    return const MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    /// 2.获取屏幕大小(逻辑分辨率 pt)--这里拿 正确✅.
    logger.w("${LogTag.tag}----屏幕宽度:${MediaQuery.of(context).size.width}pt");
    logger.w("${LogTag.tag}----屏幕高度:${MediaQuery.of(context).size.height}pt");

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
    return Container(
      color: Colors.amber,
    );
  }
}