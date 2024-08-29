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
    //return _buildDemo01();
    //return _buildDemo02();
    //return _buildDemo03();
    //return _buildDemo04();
    return _buildDemo05();
  }

  Container _buildDemo05() {
    ///5.color 和 decoration 互斥.
    /**
     *  assert(color == null || decoration == null, ⭐️⭐️⭐️⭐️ true 时候,里面不啥也不干(return)
        'Cannot provide both a color and a decoration\n'
        'To provide both, use "decoration: BoxDecoration(color: color)".',
        ),
        断言 意思是 如果 参数1 的表达式为 ture 时候内部 啥也不干, 只有 是false 时候才会断住.
     */

    return Container(
      //color: Colors.red,
      alignment: Alignment.center,

      ///子组件的对齐方式
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(50),
      width: 100,
      height: 100,
      child: Text("测试数据-05-------06"),
      decoration: BoxDecoration(
          color: Colors.red[50],
          border: Border.all(color: Colors.blue, width: 2),
          //borderRadius: BorderRadius.horizontal(left: Radius.circular(8),right: Radius.circular(8))
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
                color: Colors.greenAccent,
                offset: Offset(10, 10),
                spreadRadius: 20,///在offset 基础上往外延伸.
                blurRadius: 30,///模糊度 越大越扩散
            ),
            BoxShadow(
              color: Colors.greenAccent,
              offset: Offset(-10, -10),
              spreadRadius: 20,///在offset 基础上往外延伸.
              blurRadius: 30,///模糊度 越大越扩散
            )
          ]),
    );
  }

  Container _buildDemo04() {
    /// 4.自己有大小 有子组件 自己大小就是 宽高大小.
    ///  alignment 子组件对齐方式,也就是摆放位置(知道子组件位置) ,子组件就是包裹内容了.
    ///  内部代码 alignment 不为空,那么里面会创建一个Align组件,
    return Container(
      color: Colors.red,
      width: 200,
      height: 200,
      alignment: Alignment.center,
      child: Text("我是文本--3"),
    );
  }

  Container _buildDemo03() {
    ///3.自己有大小 有子组件 自己大小就是 宽高大小.
    /// 子组件不知道怎么摆放 那么子组件大小是跟自己一样大.--可以调试工具查看
    return Container(
      color: Colors.red,
      width: 200,
      height: 200,
      child: Text("我是文本--3"),
    );
  }

  Container _buildDemo02() {
    ///2.只有子组件包裹 子组件.
    return Container(
      color: Colors.red,
      child: Text("我是文本--2"),
    );
  }

  Container _buildDemo01() {
    ///1.没有子组件会占据父容器大小.
    return Container(
      color: Colors.red,
    );
  }
}

/**
 * Container 的布局行为:
 * https://api.flutter.dev/flutter/widgets/Container-class.html
 * Layout behavior 的说明:
 * 没有子组件会占据父容器大小.
 * 有子组件
 */
