
import 'package:flutter/material.dart';

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

  ///_ 下划线私有.

  late final Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();
    /// 意思是 只有同步信号 接收后 会来 build .
    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500),
        // lowerBound: 50,
        // upperBound: 150
        lowerBound: 0.0,
        upperBound: 1.0);

    /// 给动画设置一个 Curve 值. --比如先快 后面等.其实每一个 都是 Animation 然后不断的 parent 参数传.
    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    /// Tween-设置动画执行的value范围 调用 Tween 对象的 animation 方法 生成一个新的 Animation.
    /// PS : Tween 构造参数:begin 和 end 是 double 类型.
    /// 为何? ICON 的 size: _sizeAnimation.value 要求是 double 类型. 所以这里泛型要 double 类型.
    _sizeAnimation = Tween(begin: 50.0 , end: 150.0).animate(curvedAnimation);

    /// 添加动画监听值的改变:
    _controller.addListener(() {
      /// 重新构建: 先不考虑性能.
      setState(() {});
    });
    /// 监听动画状态改变:
    _controller.addStatusListener((status) {
        if(status == AnimationStatus.completed) {
         /// AnimationStatus.completed:  The animation is stopped at the end.
          _controller.reverse();/// 反向执行.
        }else if(status == AnimationStatus.dismissed) {
          /// AnimationStatus.dismissed : The animation is stopped at the beginning.
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画"),
      ),
      body: Center(
        child: Icon(
            Icons.favorite,
            color: Colors.red, size: _sizeAnimation.value),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          if(_controller.isAnimating) { /// 是否正在执行动画
            /// 向前 执行动画, 也就是 lowerBound to upperBound
            _controller.stop();
          }else {
            _controller.forward();/**/
          }

        },
      ),
    );
  }
}

/// 问题:
/// 1. 每次写动画 都要写 添加 _controller.addListener xxxx .
/// 2. 每次 Listener中执行 setState(() {});  都会执行 build重新构建 widget ,执行效率不高.
///
/// 优化方案:
/// 1.AnimatedWidget  -- 看 03 文件.
///   >> 将需要执动画的 Widget 放到一个 AnimatedWidget 中的 build 方法进行返回.
///
/// 2.AnimatedBuilder
///