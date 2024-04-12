import 'dart:ui';

class HYSizeFit {

  /// 逻辑宽高:pt:
  static late double screenWidth ;
  static late double screenWeight ;
  static late  double dpr ;

  ///
  static late double rpx;
  static late double px;

  static void initial({double standardSize = 750}){
    /// 使用 window 不再需要BuildContext.
    dpr = window.devicePixelRatio;
    screenWidth =  window.physicalSize.width / dpr;
    screenWeight = window.physicalSize.height / dpr;

    /// 计算 rpx 大小: 以后所有的 宽高 都*rpx 字体也乘 rpx
    rpx = screenWidth / standardSize;
    //px = screenWidth / standardSize * 2;

    /// 通过计算推导 在 iPhone6 上 1rpx = 0.5pt .所以一个 1pt = 2rpx
    px = rpx * 2;
    /// InheritedWidget .

  }

  /// 如果设计给的是 rpx 就用这个. 来适配各个屏幕上的 rpx 实际算出多少.
  static double setRpx(double size) {
    return rpx * size;
  }

  /// px 就当做 pt  比如设计给了 pt 那就用这个.
  /// 通过计算推导 在 iPhone6 上 1rpx = 0.5pt .所以一个 1pt = 2rpx
  static double setPx(double size) {
    return px * size;
  }

}

extension SizeDoubleFit on double {
  /// 使用箭头函数 巧妙的 技巧
  double get  px => HYSizeFit.setPx(this);
  /// 也开始使用getter 的 语法
  double get  rpx {
   return HYSizeFit.setRpx(this);
  }
}

extension SizeIntFit on int  {
  /// 使用箭头函数 巧妙的 技巧
  double get  px => HYSizeFit.setPx(toDouble());
  /// 也开始使用这种语法
  double get rpx {
    return HYSizeFit.setRpx(toDouble());
  }
}




