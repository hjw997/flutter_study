import 'package:logger/logger.dart';

/// 很好用的打印工具
var logger = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class LogTag {
  static const String tag = "LogTag";
}