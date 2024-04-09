
///
/// 1.动画API须知:
/// 动画要了解的三个类:
/// Animation 动画抽象类:
/// https://juejin.cn/post/6844904176321839118
///
/// 2.AnimationController : 动画控制 必须使用接收同步信号,控制动画.
///  /// 1.动画抽象类的实现类:AnimationController 传入的 this 是要 with SingleTickerProviderStateMixin 遵守这个协议
/// final controller = AnimationController(vsync: this);
/// vsync : 同步信号,屏幕的刷新率. 一秒刷新多少次.
///
/// 3.CurvedAnimation: 设置动画执行的速率曲线,可以惨考官网. parent: 是动画的 controller .
/// final animation = CurvedAnimation(parent: controller,curve:Curves.bounceIn);
///
/// 4. Tween --设置动画执行的value范围  其他地方使用这个动画,不断改变值.
/// PS: 如果动画控制器 要想使用 Curved 执行速率, lowerBound 和 upperBound 范围 为 0-1(默认就是 0-1)
/// final animation Tween(begin: 100,end: 200).animate(animation);
///
/// PS:做动画的类要是 StatefulWidget ,因为属性值 有发生变化:
