
import 'package:flutter/material.dart';


/// 可以把主题抽取到一个单独的文件 --- 便于维护管理.
class AppTheme {

  /// 还可以定义一些字体常量. 等等.
  static const double norfontSize = 18;

  /// 颜色常量等 ....
  static const Color textColor = Colors.red;

  /// 白天的主题
  static final ThemeData normalTheme = ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.amberAccent)
  );

  /// 黑色的主题.
  static final ThemeData darkTheme  = ThemeData(
      appBarTheme: const AppBarTheme(color: Colors.black12)
  );
}