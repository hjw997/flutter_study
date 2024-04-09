import 'package:flutter/material.dart';
import 'dart:async'; // 需要导入异步包

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  // 定义一个类型为int的Stream
  final _controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Demo"),
      ),
      body: Wrap(
        spacing: 20,
        children: [
          ElevatedButton(
            // 按钮点击后Stream会释放出数字1
            child: Text("Emit 1"),
            onPressed: () => _controller.add(1),
          ),
          ElevatedButton(
            // 按钮点击后Stream会释放出数字2
            child: Text("Emit 2"),
            onPressed: () => _controller.add(2),
          ),
          ElevatedButton(
            // 按钮点击后Stream会释放出一个错误
            child: Text("Emit Error"),
            onPressed: () => _controller.addError("oops"),
          ),
          ElevatedButton(
            // 按钮点击后Stream会关闭
            child: Text("Close"),
            onPressed: () => _controller.close(),
          ),
          StreamBuilder(
            stream: _controller.stream // 传入需要监听的Stream
                .map((event) => "获得数据: $event") // 将int转换成String
                .distinct(), // 去除重复的数据
            builder: (context, snapshot) {
              print("正在重新绘制StreamBuilder组件…");
              if (snapshot.connectionState == ConnectionState.done) {
                return Text("数据流已关闭");
              }
              if (snapshot.hasError) return Text("${snapshot.error}");
              if (snapshot.hasData) return Text("${snapshot.data}");
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
