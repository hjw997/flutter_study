

/// 如果某个utils 工具类下有很多个 文件,所有工具类我都想用
/// 那么可以 使用一个文件 把所有的 文件 都使用 export 'xxx.dart' 都导入.
/// 比如在项目中 导入的 import 'package:flutter/material.dart';
/// 这个里面就有很多个 dart 文件.
/// ps : 使用 library 关键字 定义一个库名字.

/// ps 以前2.0 之前是 part of "xxx.dart" 申明是某个文件的一部分.官方已经不建议使用了

library myUtils;

/// 公共导入文件 .---相当于公共的头文件.
export 'math_utils.dart';
export 'date_utils.dart';

