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
    return  Row(
      /// 主轴上 是最大,还是包裹.
      mainAxisSize: MainAxisSize.max,
      /// 主轴上对齐方式.
      mainAxisAlignment: MainAxisAlignment.start,
      /// 拉伸到尽可能大.
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// 这里的 Flexible 特点就是: ⭐️⭐️⭐️⭐️
        /// 首先 Flexible 的是 Row 或 Column 或者 Flex 的后裔,
        /// Expanded 继承 Flexible . flex 占用剩余空间的权重.
        /// 而 Expanded 会强制这个子组件扩展填充剩余可用的空间.
        /// 官方文档解释:
        /// unlike Expanded, Flexible does not require the child to fill the available space.
        /// Expanded, which forces the child to expand to fill the available space.
        /// 因为 Expanded 就是 Flexible(fit:FlexFit.tight) ,Expanded 会占满剩余空间.
        /// Expanded 所在主轴上占据空间,只和 flex 属性相关.
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.orange,
            alignment: Alignment.center,
            height: 30,
            child: Text("123",style: TextStyle(fontSize: 20),),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blueAccent,
            height:50,
            child: Text("456",style: TextStyle(fontSize: 20),),
          ),
        ),
        Container(
          width: 100,
          color: Colors.red,
          child: Text("abc",style: TextStyle(fontSize: 20),),
        ),
        Container(
          color: Colors.purpleAccent,
          width: 150,
          height: 40,
          child: Text("789",style: TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}