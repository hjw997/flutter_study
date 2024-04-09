import './pages/modal_page.dart';
import 'package:flutter/material.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
void main() {
  runApp(const MyApp());
}

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

/// ✅
/// 如何像 ios modal 弹出一个控制器界面.
/// --用materialPage 了的 fullscreenDialog 属性.

class _MyHomePageState extends State<MyHomePage> {
  void popNewPage(BuildContext ctx) {
    /// 注意 MaterialPageRoute 只能上下,或者左右的弹出界面.
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) {
        return const ModalPage();
      },
      fullscreenDialog: true,/// 像 ios Modal 出弹框.
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击页面弹出页面',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {popNewPage(context)},
        tooltip: '新界面',
        child: const Icon(Icons.pool),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
