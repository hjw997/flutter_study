import 'package:flutter/material.dart';

import 'package:dio/dio.dart'; /// 首先到如这个库--一个主文件

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
    return Container(
      color: Colors.amber,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /// 做网络请求:
    /// installing - dio: ^5.7.0
    /// 1.创建Dio对象
    final dio = Dio();
    /// 因为返回是 Future : 所以可以用then
    dio.get("https://httpbin.org/get").then((res){
      print(res);
    }).catchError((error){
      print(error);
    });

  }
}