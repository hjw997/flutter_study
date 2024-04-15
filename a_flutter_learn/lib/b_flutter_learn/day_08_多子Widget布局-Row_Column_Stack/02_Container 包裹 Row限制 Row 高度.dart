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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      /**
       * Row特点:
       *  mainAxisSize: 主轴上占据多大?
       *  - 水平方向尽可能占据比较大的空间(默认值)
       *    * 水平方向也是希望包裹内容, 那么设置mainAxisSi ze = min
       *  - 垂直方向包裹内容
       * MainAxisAlignment: 主抽上子组件怎么摆放.
       *  - start: 主轴的开始位置挨个摆放元素(默认值)
       *  - end: 主轴的结束位置挨个摆放元素
       *  - center: 主轴的中心点对齐
       *  - spaceBetween: 左右两边的间距为0, 其它元素之间平分间距
       *  - spaceAround: 左右两边的间距是其它元素之间的间距的一半
       *  - spaceEvenly: 所有的间距平分空间
       *
       * CrossAxisAlignment:交叉轴上如何摆放子布局
       *  - start: 交叉轴的起始位置对齐(默认值)
       *  - end: 交叉轴的结束位置对齐
       *  - center: 中心点对齐(默认值)
       *  - baseline: 基线对齐(必须有文本的时候才起效果)
       *  - stretch: 先让Row占据交叉轴尽可能大的空间, 再将所有的子Widget变为交叉轴的高度, 拉伸到最大.可以包裹一个 Container 来限制拉伸高度.
       */
      body: Row(
        /// 主轴方向的大小:是占满(主轴占到最大),还是包裹(主轴上包裹内容,就没有剩余空间去mainAxisAlignment了)
        mainAxisSize: MainAxisSize.max,

        /// 主轴方向上 子布局怎么摆放.(只有主轴上有剩余空间才会有效)
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        /// 交叉轴上如何布局:
        crossAxisAlignment: CrossAxisAlignment.center,

        /// 基线对齐 .交叉抽 上是基线对齐:很少用.
        //textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            color: Colors.green,
            child: const Text(
              "abc",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            color: Colors.orange,
            child: const Text(
              "123",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 80,
            color: Colors.blue,
            child: const Text(
              "你好",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            height: 30,
            color: Colors.red,
            child: const Text(
              "cde",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
