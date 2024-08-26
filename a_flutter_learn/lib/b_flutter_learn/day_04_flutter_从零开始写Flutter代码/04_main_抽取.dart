import 'package:flutter/material.dart';

/// 一行代码 箭头函数:
void main() => runApp(MyApp());

/**
 * Widget 分为:
 * 有状态的 Widget : StatefulWidget 运行过程中有一些状态(data) 需要改变.
 * 无状态: 内容是确定的,没有状态(data)的改变
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text("Hello Flutter", style: TextStyle(color: Colors.red)),
         backgroundColor: Colors.amber,
       ),
       body: const HomeContentBody(),
     );
  }
}

class HomeContentBody extends StatelessWidget {
  const HomeContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "hello",
        style: TextStyle(color: Colors.orange, fontSize: 30),
      ),
    );
  }

}
