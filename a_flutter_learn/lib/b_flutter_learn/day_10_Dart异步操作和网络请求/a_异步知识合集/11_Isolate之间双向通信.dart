import 'package:flutter/foundation.dart';
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
  var   result  = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Text("结果是:$result"),
    );
  }
  @override
  void initState() {

    super.initState();

    /// 核心使用方法 ⭐️⭐️⭐️⭐️
    getData().then((value){
      print("拿到数据:$value");
      setState(() {
        result = value;
      });
    }).catchError((onError){
      print("拿到数据:$onError");
    });
  }
}

Future<int> getData() async {
  /// 核心代码 ⭐️⭐️⭐️⭐️ : 如果双向通信 Flutter已经给我们提供了这样的已经封装好的  compute 函数.
  return await compute(calculate, 2000000000);
}

int calculate(int count){
  var total = 0;
  for (var i = 0; i < count; i++) {
    total += i;
  }
  return total;
}