import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 定义两个ScrollController滚动控制器
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scrollbar Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 280,
            child: Scrollbar(
              // 第一个滚动条
              controller: _controller1, // 使用第一个控制器
              child: ListView.builder(
                // 第一个列表（普通样式）
                controller: _controller1, // 也使用第一个控制器
                itemCount: 2000,
                itemBuilder: (context, index) =>
                    Center(child: Text("列表1的第${index + 1}个元素")),
              ),
            ),
          ),
          Container(
            height: 280,
            child: Scrollbar(
              // 第二个滚动条
              controller: _controller2, // 使用第二个控制器
              child: GridView.builder(
                // 第二个列表（网格样式）
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                controller: _controller2, // 使用第二个控制器
                itemCount: 2000,
                itemBuilder: (context, index) =>
                    Center(child: Text("网格的\n第${index + 1}个元素")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
