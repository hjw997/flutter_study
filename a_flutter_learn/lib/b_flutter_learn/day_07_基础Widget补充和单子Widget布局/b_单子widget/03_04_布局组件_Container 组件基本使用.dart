import 'package:flutter/material.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '布局组件'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  /// Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),


      body: Column(
        children: [
          ///  Container 不设置尺寸,只设置 child,并且不设置 alignment, 会和 child 一样大.
          ///  因为在无界的时候(column 垂直无界) 尽可能小.
          ///  先把父约束传递给 child 等 child 定下大小,再决定自身大小和 child 一样大.
          Container(
            color: Colors.green,
            // alignment: Alignment.center,
            child: const Text(
              "Hello Flutter",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
