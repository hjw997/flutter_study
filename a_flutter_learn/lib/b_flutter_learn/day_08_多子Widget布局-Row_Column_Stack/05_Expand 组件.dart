import 'package:flutter/cupertino.dart';
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
    return  Row(
      /// 主轴上 是最大,还是包裹.
      mainAxisSize: MainAxisSize.max,
      /// 主轴上对齐方式.
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      /// 拉伸到尽可能大.
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Expanded 继承 Flexible . flex 占用剩余空间的权重.
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
          color: Colors.red,
          child: Text("abc",style: TextStyle(fontSize: 20),),
        ),
        Container(
          color: Colors.purpleAccent,
          height: 40,
          child: Text("789",style: TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}