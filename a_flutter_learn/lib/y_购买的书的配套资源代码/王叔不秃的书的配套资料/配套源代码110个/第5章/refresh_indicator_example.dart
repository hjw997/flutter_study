import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 列表的初始内容
  List<String> items = ["第1项", "第2项", "第3项"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RefreshIndicator Demo"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // 等待2秒钟，模拟网络延时
          await Future.delayed(Duration(seconds: 2));
          // 添加新内容，并附加时间戳
          setState(() {
            items.add("新增内容：${DateTime.now()}");
          });
        },
        child: ListView(
          // 通过滚动列表将items的全部内容显示出来
          children: items.map((item) => Text("$item")).toList(),
        ),
      ),
    );
  }
}
