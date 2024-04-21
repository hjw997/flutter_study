import 'dart:math';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        body: ListView(
          /// 水平滚动要告诉 每个 item 的宽度,
          //  scrollDirection: Axis.horizontal,
          /// 设置主轴方向上的高度.不设置就是根据内容来决定高度.
          itemExtent: 80,

          /// 倒序:
          /// reverse: true,
          /// 是否关联父类的 控制器,用来做滚动监听.
          // primary: ,
          // controller: ,
          // physics: ScrollPhysics,

          children: List.generate(
            100,
            (index) {
              /// List.generate : 返回什么 列表中存的是什么
              /// https://blog.logrocket.com/how-add-list-tile-flutter/
              ///
              return ListTile(
                title: Text("User--$index电话号:"),
                subtitle: Text("手机号+86-$index"),
                leading: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, Random().nextInt(255),
                      Random().nextInt(250), Random().nextInt(255)),
                ),
                trailing: const Icon(Icons.delete),
                dense: true,
              );
            },
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }
}

/// 使用场景 ✅: ListView(children:List<Widget> ) 默认构造使用场景,当有明确的 widget 有 a small number of children .
/**
 * 官方说明:
 * https://api.flutter.dev/flutter/widgets/ListView-class.html
 *
 * The default constructor takes an explicit List<Widget> of children.
 * This constructor is appropriate for list views with a small number of children
 * because constructing the List requires doing work for every child that could possibly be displayed in the list view instead of just those children that are actually visible.
 * 因为这个 List 要创建尽可能多的 child widget , 代替界面上实际可见的数量.
 * 所以这个使用 基本类似 像设置界面,有一个 Cell 的界面.
 *
 * 如果界面上有 a large number of children 的时候使用 ListView.builder构造函数.
 *
 */
