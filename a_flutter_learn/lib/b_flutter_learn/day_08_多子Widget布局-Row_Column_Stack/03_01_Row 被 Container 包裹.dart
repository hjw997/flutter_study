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
    /// Container 不设置大小,并且设置子组件回和子组件一样大.
    return Container(
      color: Colors.amber,

      child: Row(
        /// 主轴上 是最大,还是包裹.
        mainAxisSize: MainAxisSize.max,
        /// 主轴上对齐方式.
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        /// 拉伸到尽可能大.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.orange,
            height: 30,
            child: Text("123",style: TextStyle(fontSize: 20),),
          ),
          Container(
            color: Colors.blueAccent,
            height:50,
            child: Text("456",style: TextStyle(fontSize: 20),),
          ),
          Container(
            color: Colors.red,
            height: 20,
            child: Text("abc",style: TextStyle(fontSize: 20),),
          ),
          Container(
            color: Colors.purpleAccent,
            height: 40,
            child: Text("789",style: TextStyle(fontSize: 20),),
          ),
        ],
      ),
    );
  }
}
