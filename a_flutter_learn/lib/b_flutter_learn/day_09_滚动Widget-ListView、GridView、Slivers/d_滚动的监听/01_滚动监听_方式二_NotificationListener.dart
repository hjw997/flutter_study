import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logcat/flutter_logcat.dart';

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
  /// 方式二: NotificationListener --> 是个 Widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          logger.i("${LogTag.tag}----监听到滚动");

          /// ScrollNotification 抽象类,具体是哪种滚动通知这里判断类型.
          if (notification is ScrollStartNotification) {
            logger.d("${LogTag.tag}---开始滚动}");
          } else if (notification is ScrollUpdateNotification) {
            ///metrics尺寸, 丈量: ✅:
            logger.w(
                "${LogTag.tag}-正在滚动ing--总滚动区域: ${notification.metrics.maxScrollExtent} 滚动了${notification.metrics.pixels}");
          } else if (notification is ScrollEndNotification) {
            logger.e("${LogTag.tag}---结束滚动}");
          }

          /// 返回值是否是把事件冒泡上去-具体看注释
          return false;
        },
        child: ListView.builder(
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
      ),
      // floatingActionButton: _isShowFloatBtn
      //     ? FloatingActionButton(
      //         child: Icon(Icons.arrow_upward),
      //         onPressed: () {
      //           ///返回到顶部:
      //           //controller.jumpTo(0);
      //           _controller.animateTo(0,
      //               duration: const Duration(milliseconds: 500),
      //               curve: Curves.easeIn);
      //           _isShowFloatBtn = false;
      //           setState(() {});
      //         },
      //       )
      //     : null,
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
