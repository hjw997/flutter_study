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
        body: ListView.separated(
            itemCount: 50,

            ///typedef NullableIndexedWidgetBuilder = Widget? Function(BuildContext context, int index);
            itemBuilder: (BuildContext context, int index) {
              /// 回调函数:当 cell 要展示到屏幕的时候来回调.
              return ListTile(
                leading: Icon(
                  Icons.person_add_alt,
                  color: Color.fromARGB(255, Random().nextInt(255),
                      Random().nextInt(250), Random().nextInt(255)),
                ),
                title: Text("Hello$index"),
                subtitle: Text("+86--$index"),
              );
            },
            /// 分割线的 builder :
            separatorBuilder:(BuildContext ctx,int index) {
              //return Container(width: double.infinity,height: 5,color: Colors.blueAccent,);
              return const Divider(color: Colors.blueAccent,thickness: 2,indent: 10,endIndent: 15,);
            }
        )
    );
  }
}

/// PS:构建某个组件的时候,如果有回调函数,一般都是在加载组件的时候回调这个方法.
