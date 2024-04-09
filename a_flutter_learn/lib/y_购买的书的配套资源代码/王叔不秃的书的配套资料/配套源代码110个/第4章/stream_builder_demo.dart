import 'dart:math';

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
  Stream<int> counter() => Stream.periodic(Duration(seconds: 1), (count) {
    if (Random().nextBool()) throw "oops"; // 随机产生50%的异常
    return count;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LinearProgressIndicator Demo"),
      ),
      body: StreamBuilder(
        stream: counter(), // 传入Stream
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          // 观察ConnectionState的状态
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text("NONE: 没有数据流");
            case ConnectionState.waiting:
              return Text("WAITING: 等待数据流");
            case ConnectionState.active:
              if (snapshot.hasError) {
                return Text("ACTIVE: 数据流活跃，异常: ${snapshot.error}");
              } else if (snapshot.hasData) {
                return Text("ACTIVE: 数据流活跃，数据: ${snapshot.data}");
              }
              throw "当数据流活跃时，不会发生两者皆空的情况";
            case ConnectionState.done:
              return Text("DONE: 数据流关闭");
            default:
              throw "ConnectionState没有别的状态";
          }
        },
      ),
    );
  }
}
