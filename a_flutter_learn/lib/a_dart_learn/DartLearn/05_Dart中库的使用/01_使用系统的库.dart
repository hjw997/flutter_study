

/// import 'dart:core'; dart 核心库不需要导入.


/// 如果是其他的库就要导入了.
// import 'dart:io'; /// IO库.
// import 'dart:isolate'; /// 线程
// import 'dart:async'; ///异步
// import 'dart:math';

/// 首先要知道一点:在dart 中默认情况下,一个dart文件就是一个模块(库文件)

/// 1.系统的库 使用语法:
/// import 'dart:库的名字';
import 'dart:math'; ///引用系统库.

main(List<String> args) {
  /// 像 List Map 这种都是属于 core 核心库的,核心库是不需要导入的.
  List list = [];
  Map map = {};



  final num1 = 20;
  final num2 = 30;
  /// 报错: Error: Library doesn't support null safety.
  /// Edit Configurations -> VM option 添加参数:  --no-sound-null-safety
  print(min(num1, num2));
}

