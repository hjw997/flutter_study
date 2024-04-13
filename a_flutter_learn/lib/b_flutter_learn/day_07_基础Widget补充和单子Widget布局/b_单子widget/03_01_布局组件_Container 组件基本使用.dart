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

      /// 如果觉得 Align 沾满屏幕那么 外面套一层 Container 组件.
      /// 因为 Container 是可以设置 宽高的.
      /// Container 还可以设置 子组件的对齐方式(在容器的哪里 通过alignment 属性)
      body: Container(
        width: 200,
        height: 200,

        /// 这个属性会作用在 child 上. 让 child 在自身里怎么放
        /// 如果有 child 不设置这个属性, 会把 child 拉扯到跟自身一样大.
        //alignment: Alignment.topCenter,

        /// margin 和 padding 属性 是  EdgeInsets.xx 构建的
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green,

          /// 设置圆角:
          //borderRadius: const BorderRadius.all(Radius.circular(10)),
          // 只有常量构造函数才能 用 const 修饰.
          borderRadius: BorderRadius.circular(20),

          /// 设置边框:
          //border: Border(bottom: BorderSide())),
          /// 使用工厂构造:
          border: Border.all(width: 2, color: Colors.black),
          boxShadow: const [
            BoxShadow(
                color: Colors.red,
                offset: Offset(10, 10),
                blurRadius: 20,
                spreadRadius: 8,
                blurStyle: BlurStyle.outer),
            BoxShadow(
                color: Colors.blueAccent,
                offset: Offset(-10, -10),
                blurRadius: 10,
                spreadRadius: 8,
                blurStyle: BlurStyle.outer),
          ],
        ),

        /// color会和decoration冲突
        //color: Colors.red,
        child: Container(
          width: 80,
          height: 80,
          color: Colors.blue,

          /// Align是中是占满父组件的.
          child: const Align(
            heightFactor: 2,
            widthFactor: 1,
            alignment: Alignment.topLeft,
            child: Icon(Icons.pets),
          ),
        ),
      ),
    );
  }
}
