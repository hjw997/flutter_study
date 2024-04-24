import 'dart:math';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 去掉这个 appBar 列表就会到状态栏下面.
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      /// 给列表包裹一个SafeArea 安全区域:--就不会从状态栏下面穿透过去.
      body: SafeArea(
        child: CustomScrollView(
          /// 虽然这个属性 看似个 Widget 数组,但是不可以发普通 Widget
          /// What is Sliver :
          /// 官网解释:https://api.flutter.dev/flutter/widgets/CustomScrollView/slivers.html
          /**Slivers
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
          slivers: [
            SliverGrid(
                ///SliverChildDelegate 两个子类,其中的 List的传入 children 效率不高. 下面使用 builder.
                ///再来回顾ListView 的够钟构造中的 都有一个 SliverChildDelegate childrenDelegate; 属性,ListView 是里面创建了.
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return Container(
                      color: Color.fromARGB(255, Random().nextInt(255),
                          Random().nextInt(250), Random().nextInt(255)),
                      alignment: Alignment.center,
                      child: Text("索引$index"),
                    );
                  },
                  /// 如果不给 child count 是无穷个.
                  childCount: 100,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 5)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
/// 如果我现在想将 列表滚动的时候穿透过状态栏. 那么怎么处理? 此时SafeArea 解决不了. 看下一个案例