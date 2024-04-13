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
  /// 叶子组件 如 Image 等:
  /// https://api.flutter.dev/flutter/widgets/LeafRenderObjectWidget-class.html
  ///
  /// 布局组件:https://docs.flutter.dev/ui/widgets/layout
  ///
  /// 比较重要的几个常用的布局组件:  Align
  /// 在 Flutter 中 如果让某个组件放到一个父组件的 某个位置,通过布局来设置. 不再像 ios setFrame 那样.
  /// Align 就是可以让子组件放到 某个位置的.
  /// 如果想放到中间 有个快捷组件: Center 其实就是 默认的 Align 组件.
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      /// Align 默认就是 this.alignment = Alignment.center, 居中的.
      /// 关于 Alignment 的坐标:
      /// https://biglead.blog.csdn.net/article/details/94167281
      /// Align 特点:会尽可能占满 父组件. 如果想要设置个固定大小 可以包一层Container.
      body: const Align(
        child: Icon(Icons.pets),
      ),
    );
  }
}
