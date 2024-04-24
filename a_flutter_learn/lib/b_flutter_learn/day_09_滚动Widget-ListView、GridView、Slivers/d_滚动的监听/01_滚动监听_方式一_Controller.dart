import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/logger_config.dart';

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
  /// 方式一: Controller 有个初始化偏移的参数.
  final ScrollController _controller = ScrollController(initialScrollOffset: 0);
  var _isShowFloatBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      logger.i("${LogTag.tag}----监听到滚动${_controller.offset}}");
      if (_controller.offset > 400) {
        _isShowFloatBtn = true;
        setState(() {});
      } else {
        _isShowFloatBtn = false;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    /// 安全起见释放内存.
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        /// 监听方式1:使用 Controller 的方式. 因为我们监听滚动是要做些事情的, 所以 使用 StatefulWidget
        controller: _controller,
        itemCount: 200,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              Icons.people,
              color: Color.fromARGB(255, Random().nextInt(255),
                  Random().nextInt(250), Random().nextInt(255)),
            ),
            title: Text("联系人---$index"),
          );
        },
      ),
      floatingActionButton: _isShowFloatBtn
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                ///返回到顶部:
                //controller.jumpTo(0);
                _controller.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                _isShowFloatBtn = false;
                setState(() {});
              },
            )
          : null,
    );
  }
}

/***
 * 监听滚动两种方式:
 * 1.Controller (有限制-无法监听开始滚动和结束滚动等)
 *   > a.可以设置默认值的 offset 值,
 *   > b.监听滚动,也可以监听滚动的位置.
 *
 * 2.NotificationListener --可以监听到何时开始停止滚动等.
 *   看下一个案例:
 */
