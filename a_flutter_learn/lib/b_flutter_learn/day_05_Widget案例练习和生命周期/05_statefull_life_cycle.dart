import 'package:a_flutter_learn/utils/logger_config.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        home: Scaffold(
          appBar: AppBar(title: const Text("StateFull_LifeCycle")),
          body: HYHomeContent(),
          floatingActionButton:
              FloatingActionButton(child: const Icon(Icons.add), onPressed: () {
                setState(() {
                  /// ⭐️⭐️⭐️⭐️⭐️ 这里 setState 时候, 整个 build 会重走, HYHomeContent就会新建.
                  /// 此时 内部的 didUpdateWidget 就会调用.
                });
              }),
        ));
  }
}

/// StatefulWidget 两个类
/// 一个是 Widget :
///     a.Widget 构造方法
///     b.createState 方法.
/// 另一个是 State 类:
/// https://api.flutter.dev/flutter/widgets/State-class.html
///
class HYHomeContent extends StatefulWidget {
  HYHomeContent({super.key}) {
    logger.i("${LogTag.tag}----1. 调用StatefulWidget 构造函数");
  }

  @override
  //State<HYHomeContent> createState() => _HYHomeContentState();
  State<HYHomeContent> createState() {
    logger.i("${LogTag.tag}----2. 调用 createState() 函数");
    return _HYHomeContentState();
  }
}

class _HYHomeContentState extends State<HYHomeContent> {
  int _count = 0;

  _HYHomeContentState() {
    logger.i("${LogTag.tag}----3. 调用  State的构造 函数");
  }

  @override
  void initState() {
    /// 强调:这里必须要调用 super
    ///  @mustCallSuper
    super.initState();

    /// 再 build 之前要先初始化一些 状态.
    logger.i("${LogTag.tag}----4. 调用 initState 函数");
  }

  /**
   * 父组件 更新了 相同 位置的 Widget .也就是新创建了一个Widget. 此时 就会调用这个方法
   *
   * During this time, a parent widget might rebuild and request
   * that this location in the tree update to display a new widget with the same runtimeType and Widget.key.
   *
   * When this happens, the framework will update the widget property to refer to the new widget
   * and then call the didUpdateWidget method with the previous widget as an argument.
   *
   * State objects should override didUpdateWidget to respond to changes in their associated widget (e.g., to start implicit animations).
   * The framework always calls build after calling didUpdateWidget, which means any calls to setState in didUpdateWidget are redundant.
   */
  @override
  void didUpdateWidget(covariant HYHomeContent oldWidget) {
    /**
     * 父组件 setState 后 父组件 重新走了 build ,新建了 HYHomeContent 组件.
     * 调用流程: 1. 调用StatefulWidget 构造函数 ->  调用 didUpdateWidget ---> 5.调用 build 函数
     */
    super.didUpdateWidget(oldWidget);
    logger.i("${LogTag.tag}---- 调用 didUpdateWidget 函数 $oldWidget");
  }

  /**
   * 执行 didChangeDependencies 方法，这个方法在两种情况下会调用
   *  情况一：调用initState会调用；
      情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的InheritedWidget（这个后面会讲到）；
   */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    logger.i("${LogTag.tag}---- didChangeDependencies -----");
  }

  /**
   * 1.第一次构建
   * 2.setState 状态发生改变对来调用 build
   */
  @override
  Widget build(BuildContext context) {
    logger.i("${LogTag.tag}----5.调用 build 函数");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                child: const Text("+")),
            Text("当前计数:$_count")
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    // @mustCallSuper
    super.dispose();

    logger.i("${LogTag.tag}----6.调用 build 函数");
  }
}
