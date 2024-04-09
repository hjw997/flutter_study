import 'package:a_flutter_learn/utils/logger_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => const MyApp();

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

///  StatelessWidget 生命周期 很简单. 用的最多的还是StatefulWidget
///
class HYHomeContent extends StatefulWidget {
  HYHomeContent({super.key}) {
    logger.i("${LogTag.tag}----构造函数");
  }

  @override
  State<HYHomeContent> createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    logger.i("${LogTag.tag}----build 函数");
    return const Placeholder();
  }
}
