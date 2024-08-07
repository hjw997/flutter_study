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
    /// Stack 默认的大小是包裹内容.
    /// 类似安卓中的 FrameLayout .
    /// stack: 布局算法---
    /// 分为: "无位置" 和 "有位置(Positioned包裹的)"
    /// 先通过 fit 属性把约束传递给 children 中的 "无位置" 子元素,
    /// 子元素根据 fit : StackFit.expand / StackFit.loose 来决定子元素布局
    /// 然后 Stack 包裹其中 最大宽 和 高作为自己的大小.
    /// 如果,children中 全是 "有位置的"那么 ,Stack 就会即可能和父级一样大.
    ///
    /// 也可以使用 Container 限制大小, 配合 fit : StackFit.expand,
    return Stack(
    /// * Stack默认的大小是包裹内容的
    /// *  - alignment: 从什么位置开始排布所有的子Widget
    /// *  - fit: expand(很少) 将子元素拉伸到尽可能大
    /// *  - overflow: 超出部分如何处理
      alignment: AlignmentDirectional.center,

      ///  StackFit.loose 按照子元素原本大小排布.
      ///  StackFit.expand 将子元素拉伸到尽可能大
      fit: StackFit.loose,
      children: [
        /// Container 不设置尺寸,只设置 child,并且设置 alignment
        /// 因为在无界的时候(column 垂直无界) 尽可能小,小到和 child 一样.
        /// 在有边界的方向上尽可能大(此处因为 Column 交叉轴上是屏幕宽度)
        /// 因为要使用 alignment 对子组件摆放.
        /// 最终是 宽度是屏幕宽度,高度是尽可能小,这里是包裹子组件
        Container(
          color: Colors.orange,
          alignment: Alignment.center,
          height: 30,
          child: const Text(
            "123",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.asset("assets/images/juren.jpeg"),
        Container(
          width: 100,
          color: Colors.red,
          child: Text(
            "abc",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          color: Colors.purpleAccent,
          width: 150,
          height: 40,
          child: Text(
            "789",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
