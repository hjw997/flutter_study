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

class MyHomePage extends StatelessWidget {
  Future<String> loadData() async {
    await Future.delayed(Duration(seconds: 2)); // 等待2秒
    // throw "404 data not found"; // 若需测试异常情况，可把注释去掉
    return "Hi hi"; // 正常返回数据
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LinearProgressIndicator Demo"),
      ),
      body: FutureBuilder(
        future: loadData(), // 读取网络数据，异步函数，返回一个Future类型
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          // 检查ConnectionState是否为done，以此判断Future是否结束
          if (snapshot.connectionState == ConnectionState.done) {
            // 当Future结束时，data和error必有一个不是空
            if (snapshot.hasError) {
              // 判断是否有错误，有则显示错误
              return Text("ERROR: ${snapshot.error}");
            } else {
              // 没有错误，则显示数据
              return Text("DATA: ${snapshot.data}");
            }
          } else {
            // Future还没结束，因此渲染一个圆形进度条
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
