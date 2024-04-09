import 'package:flutter/material.dart';

import '../../utils/logger_config.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  const HYHomePage({super.key});

  @override
  State<HYHomePage> createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> with SingleTickerProviderStateMixin {

  /// 1. 无论什么动画都要先 创建一个 Controller.
  // final controller = AnimationController(vsync: this); /// this 是当前调用对象. 所以写方法中
  late final AnimationController _controller;

  late final Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500));

    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _sizeAnimation = Tween(begin: 50.0 , end: 150.0).animate(curvedAnimation);

    /// 监听动画状态改变:
    _controller.addStatusListener((status) {
        if(status == AnimationStatus.completed) {

          _controller.reverse();

        }else if(status == AnimationStatus.dismissed) {

          _controller.forward();
        }
    });
  }

  @override
  void dispose() {
    /// 销毁动画相关的资源.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.i("${LogTag.tag}----HYHomePage-build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画"),
      ),
      body: Center(
        child: HeartAnimatedWidget(_sizeAnimation),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          if(_controller.isAnimating) {
            _controller.stop();
          }else {
            _controller.forward();/**/
          }

        },
      ),
    );
  }
}

///  ✅ 现在虽然优化了只构建 要动画的 Widget .
/// 但是缺点:
/// 1. 每次都要创建一个 这个类.
/// 2. 如果构建的动画 Widget 还有 child 那么子 Widget 也要被重新构建.如果我不希望里面的 child 也被构建 --最优解: AnimatedBuilder
///

class HeartAnimatedWidget extends AnimatedWidget {
  /// 本质:其实 就是父类做了监听
  /// 要调用父类的 方法传入listenable 必传参数给父类. Animation 就是 Listenable 的.
  const HeartAnimatedWidget(Animation animation, {super.key}): super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation anima = listenable as Animation;
    /// 优化后以后只会执行 这个 build 方法构建要做动画的对象.
    logger.i("${LogTag.tag}----HeartAnimatedWidget-build");
    return Icon(
        Icons.favorite,
        color: Colors.red, size: anima.value);
  }

}

/// 问题:
/// 1. 每次写动画 都要写 添加 _controller.addListener xxxx .
/// 2. 每次 Listener中执行 setState(() {});  都会执行 build重新构建 widget ,执行效率不高.
///
/// 优化方案:
/// 1.AnimatedWidget
///   >> 将需要执动画的 Widget 放到一个 AnimatedWidget 中的 build 方法进行返回.
///   缺点:
///   1.每次都要创建一个类.
///   2.如果构建的动画 Widget 还有 child 那么子 Widget 也要被重新构建.如果我不希望里面的 child 也被构建 --最优解: AnimatedBuilder

/// 继续改进:
/// 2.AnimatedBuilder 看 第 4 个案例.