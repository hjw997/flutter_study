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
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            /// flexibleSpace这个是个 Widget.
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Hello World",style:TextStyle(color: Colors.deepOrange),),
              background: Image.asset("assets/images/juren.jpeg", fit: BoxFit.cover),
              stretchModes: const [StretchMode.zoomBackground],
            ),
            pinned: true,
          ),

          /// 网格的 Sliver
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext ctx, int index) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Color.fromARGB(255, Random().nextInt(255),
                        Random().nextInt(250), Random().nextInt(255)),
                    alignment: Alignment.center,
                    child: Text("$index"),
                  );
                },
                childCount: 9,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 10)),

          ///列表只有一个 Delegate
          SliverList(
              delegate: SliverChildListDelegate(List.generate(20, (index) {
            return ListTile(
              leading: Icon(Icons.people,
                  color: Color.fromARGB(255, Random().nextInt(255),
                      Random().nextInt(250), Random().nextInt(255))),
              title: Text("联系人:$index"),
              subtitle: Text("86+$index"),
            );
          })))
        ],
      ),
    );
  }
}
