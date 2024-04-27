///
///
/// 1h44 分开始讲 key .

import 'dart:math';

import 'package:flutter/material.dart';

import '../../utils/logger_config.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key 原理',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Key 的作用'),
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
  final List names = ["aaaa", "bbb", "cccc"];

  @override
  Widget build(BuildContext context) {
    logger.e("${LogTag.tag}--_MyHomePageState_build方法调用--$names");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: names.map((name) {
          return ListItemStatefulWidget(
            name,

            /// -------加入 Key.有相同的key 的时候 canUpdate中就会去判断时候使用这个key 做判断使用.
            key: ValueKey(name),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            /// setState内部:  _element!.markNeedsBuild();  标记为需要重新构建
            names.removeAt(0);
          });
        },
        tooltip: '删除',
        child: const Icon(
          Icons.delete,
          color: Colors.deepOrange,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListItemStatefulWidget extends StatefulWidget {
  final String name;

  ListItemStatefulWidget(this.name, {super.key});

  @override
  State<ListItemStatefulWidget> createState() {
    /// 打印发现这里的 state 再数据删除后,并没有重新创建 createState 创建.
    /// 所以随机颜色也不会重新创建.
    logger.e("${LogTag.tag}--createState方法调用--");
    return _ListItemStatefulState();
  }
}

class _ListItemStatefulState extends State<ListItemStatefulWidget> {
  final Color randomColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(250), Random().nextInt(255));

  @override
  Widget build(BuildContext context) {
    logger.e("${LogTag.tag}--build方法调用--${widget.name}");
    return Container(
      color: randomColor,
      alignment: Alignment.center,
      child: Text(
        widget.name,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }
}

///  针对前面的情况.我们这里改为 StatefulWidget.
///  此时 我们通过打印发现 删除一个数据以后, createState 并没有调用,只是调用了 state 的 build 方法.
///  因为 state 没有重新创建, 我们知道创建一个 Widget 会创建对应的 Element ,
///  StatefulWidget 创建的是 StatefulElement
///  StatefulElement(StatefulWidget widget) : _state = widget.createState(), Element 会保存 state.
///  所以 Element 中保存的 state 随机色还有之前的.
///  发现 最后的一个颜色被删除了:
///  Key: 这个key属性类似于 React/Vue 中的key，主要的作用是决定是否在下一次build时复用旧的 widget ，决定的条件在canUpdate()方法中。
///
///  canUpdate(...)是一个静态方法，它主要用于在 widget 树重新build时复用旧的 widget ，其实具体来说，
///  应该是：是否用新的 widget 对象(也就是对应的 Element 对象) 去更新旧UI树上所对应的Element对象的配置；
///  通过其源码我们可以看到:
///    static bool canUpdate(Widget oldWidget, Widget newWidget) {
///      return oldWidget.runtimeType == newWidget.runtimeType && oldWidget.key == newWidget.key;
///   }
///  只要newWidget与oldWidget的runtimeType和key 同时相等时(也就是 结果是 true) 就会用new widget去更新Element对象的配置，
///  否则(如果是 false ) 就会创建新的Element。创建新的 Element 就会重新调用 createState 创建 State. 所以 State 的 build 也会调用.

/// 上面添加了 ValueKey 以后就 可以在 Widget 的 canUpdate 中使用 Key 做条件判断是否要新生成一个 Element 还是更新这个 Element .
