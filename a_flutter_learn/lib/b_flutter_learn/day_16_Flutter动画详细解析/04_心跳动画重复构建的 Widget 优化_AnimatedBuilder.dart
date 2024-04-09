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

class _HYHomePageState extends State<HYHomePage>
    with SingleTickerProviderStateMixin {
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

    CurvedAnimation curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(curvedAnimation);

    /// 监听动画状态改变:
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
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

        /// ✅ 继续改进:
        /// 2.AnimatedBuilder
      child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            /// 这里传入的 child 就是 AnimatedBuilder 构建的时候传入的 child ,不用每次反复创建,类似用法 Consumer 也有传入 child.
            return Icon(Icons.favorite,
                color: Colors.red, size: _sizeAnimation.value);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            _controller.forward(); /**/
          }
        },
      ),
    );
  }
}
