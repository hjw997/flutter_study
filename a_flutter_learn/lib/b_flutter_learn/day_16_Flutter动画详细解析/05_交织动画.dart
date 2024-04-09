
import 'dart:math';

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
  State<HYHomePage> createState() => HYHomePageState();
}



/// 交织动画 : 多个动画混在一起的.
///
/// https://docs.flutter.dev/ui/animations/staggered-animations

class HYHomePageState extends State<HYHomePage>
    with SingleTickerProviderStateMixin {
  /// 1. 无论什么动画都要先 创建一个 Controller.
  late final AnimationController _controller;

  /// 1.颜色的 Tween
 late final Animation _colorAnim;
  /// 2.透明度的 tween
 late final Animation _opacityAnim;
  /// 3.弧度的 tween
 late final Animation _radiusAnim;
 /// 4. size 大小的 tween
 late final Animation _sizeAnim;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 500));

    CurvedAnimation curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    /// 创建 Tween :
    /// 1.颜色的 Tween
    _colorAnim  =  ColorTween(begin: Colors.blue,end: Colors.orange).animate(_controller);
    /// 2.透明度的 tween
    _opacityAnim = Tween(begin: 0.0,end: 1.0).animate(_controller);
    /// 3.弧度的 tween
    _radiusAnim = Tween(begin: 0.0,end: pi*2.0).animate(_controller);
    /// 4. size 大小的 tween
    _sizeAnim   = Tween(begin: 50.0 ,end: 150.0 ).animate(_controller);

    /// 监听动画状态改变:
    _controller.addStatusListener((status) {

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
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx,child) {
            return Opacity(
              opacity: _opacityAnim.value,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(_radiusAnim.value),
                child: Container(
                  width: _sizeAnim.value,
                  height: _sizeAnim.value,
                  color: _colorAnim.value,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: (){
          ///Starts running this animation forwards (towards the end).
          _controller.forward();
        },
      ),
    );
  }
}
