import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

    /// Positioned 用在 Stack 中就是 "有位置"的组件,用来精确定位.
    /// 但是注意如果 Positioned 没有设置任何属性,就等于 没有包裹Positioned,就是"无位置组件"
    /// 因为 Positioned 是 ParentDataWidget<StackParentData> 类型的,只是记录数据,
    /// 帮助 Stack 后面给 Positioned 精确布局.
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.loose,
      ///clipBehavior:  如果溢出 Stack 后怎么处理.
      clipBehavior:Clip.none,
      children: [
        Container(
          color: Colors.orange,
          alignment: Alignment.center,
          height: 80,
          width: 80,
          child: const Text(
            "123",
            style: TextStyle(fontSize: 20),
          ),
        ),
        /// Positioned如果不设置(或者设置不全)对齐方式,就是会默认按照Stack 设置的去布局.

        Positioned(
          left: 0,
          child: Container(
            color: Colors.blueAccent,
            height: 50,
            child: const Text(
              "456",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Container(
          width: 100,
          color: Colors.red,
          child: const Text(
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
        /// 如果溢出 Stack 后怎么处理.
        /// clipBehavior: Clip.none,--溢出不裁剪.
        Positioned(
          bottom: -20,
          right: -20,
          child: Container(
            color: Colors.cyanAccent,
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: const Text(
              "溢",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
