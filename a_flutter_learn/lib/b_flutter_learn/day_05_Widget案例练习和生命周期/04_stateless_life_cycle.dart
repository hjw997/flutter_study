import 'package:flutter/material.dart';

import '../../utils/logger_config.dart';

void main() {runApp(const MyApp());}

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
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home:  HYHomeContent()
    );
  }
}

/// StatelessWidget 生命周期
///  > 1.构造方法
///  > 2.build 方法.
///  StatelessWidget 生命周期 很简单. 用的最多的还是StatefulWidget
class HYHomeContent extends StatelessWidget {
  HYHomeContent({super.key}) {
    logger.i("${LogTag.tag}----构造函数调用---");
  }

  @override
  Widget build(BuildContext context) {
    logger.i("${LogTag.tag}----build 函数---调用");
    return const Placeholder();
  }
}
