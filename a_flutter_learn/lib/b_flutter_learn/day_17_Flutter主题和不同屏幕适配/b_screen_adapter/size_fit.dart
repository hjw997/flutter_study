import 'dart:ui';

class HYSizeFit {

  /// 逻辑宽高:pt:
  static late double screenWidth ;
  static late double screenWeight ;
  static late  double dpr ;

  static void initial(){
    /// 使用 window 不再需要BuildContext.
    dpr = window.devicePixelRatio;
    screenWidth =  window.physicalSize.width / dpr;
    screenWeight = window.physicalSize.height / dpr;

  }

  //
  // /// 3. window 拿 (源码中初始化: window.physicalSize / window.devicePixelRatio )
  // logger.d("${LogTag.tag}----window size: ${window.physicalSize / window.devicePixelRatio}");
  // final dpr = window.devicePixelRatio;
  // final height = window.physicalSize.height / dpr;
  // final width = window.physicalSize.width / dpr;
  // logger.d("${LogTag.tag}----宽高是:$width * $height");
  //
  // /// 状态栏 底部安全区域 等 都可以 使用 padding.top padding.bottom
  // logger.d("${LogTag.tag}----top:${MediaQuery.of(context).padding.top}");
  // logger.d("${LogTag.tag}----bottom:${MediaQuery.of(context).padding.bottom}");
  //
  // /// PS 使用 window.padding 这样拿是物理像素,所以 pt 就要除以 物理宽高/ dpr 就是 pt.
  // logger.d("${LogTag.tag}----top:${window.padding.top}");
  // logger.d("${LogTag.tag}----bottom:${window.padding.bottom}");
}