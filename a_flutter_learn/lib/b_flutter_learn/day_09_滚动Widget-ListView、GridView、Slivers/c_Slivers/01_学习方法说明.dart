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
    /// 学习方法看 两个类有啥区别-点入源码看继承关系:
    ListView? list = null;
    GridView? gride = null;
    /// 发现 两个类继承关系都是 一样的 BoxScrollView
    /** 这俩类都继承自 BoxScrollView , 实现了
     *  List<Widget> buildSlivers(BuildContext context) {
        Widget sliver = buildChildLayout(context);
        这个抽象方法让 ListView 和 GridView 返回 Sliver  .
        说了这么多都是为了返回一个 Sliver.
        那么 Sliver 是什么? 看笔记截图:
        ...
        return [sliver]; 都是返回了一个 Sliver.
        }
     */
    /**
     *
     * Slivers
        我们考虑一个这样的布局：一个滑动的视图中包括一个标题视图（HeaderView），一个列表视图（ListView），一个网格视图（GridView）。

        我们怎么可以让它们做到统一的滑动效果呢？使用前面的滚动是很难做到的。

        Flutter中有一个可以完成这样滚动效果的Widget：CustomScrollView，可以统一管理多个滚动视图。

        在CustomScrollView中，每一个独立的，可滚动的Widget被称之为Sliver。

        补充：Sliver可以翻译成裂片、薄片，你可以将每一个独立的滚动视图当做一个小裂片。

        4.1. Slivers的基本使用

        因为我们需要把很多的Sliver放在一个CustomScrollView中，所以CustomScrollView有一个slivers属性，里面让我们放对应的一些Sliver：

        SliverList：类似于我们之前使用过的ListView；

        SliverFixedExtentList：类似于SliverList只是可以设置滚动的高度；

        SliverGrid：类似于我们之前使用过的GridView；

        SliverPadding：设置Sliver的内边距，因为可能要单独给Sliver设置内边距；

        SliverAppBar：添加一个AppBar，通常用来作为CustomScrollView的HeaderView；

        SliverSafeArea：设置内容显示在安全区域（比如不让齐刘海挡住我们的内容）
     *
     */
    return Container(
      color: Colors.amber,
    );
  }
}

/// 1h - 44 分开始分析代码.