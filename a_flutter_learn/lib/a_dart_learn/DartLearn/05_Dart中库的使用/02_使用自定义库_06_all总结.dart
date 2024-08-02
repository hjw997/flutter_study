/**
 * 1.补充一: as关键字给库起别名
 * 2.补充二: 默认情况下载导入一个库时, 导入这个库中所有的内容
 *    * show: 执行要导入的内容
 *    * hide: 隐藏某个要导入的内容, 但是导入其它内容
 * 3.公共的dart文件的抽取: export
 * 4._下划线是区分 私有和 公共的一种方式.
 */

import 'utils/math_utils.dart' as mUtils;
import "utils/math_utils.dart" show sum, mul;
import "utils/math_utils.dart" hide mul;

import 'utils/date_utils.dart';

/// 1. 导入自己的库: 如果这里自动导入的路径比较复杂可以自己去敲,补全为相对路径.
import "utils/utils.dart";

main(List<String> args) {
  ///0. 比如我们自己封装了一个自己的库 ,  在 utils下 封装自己的 math_utils.dart 库.
  print(sum(20, 30));

  print(sum(20, 30));
  // print(mul(20, 30));
  print(dateFormat());

  min(20, 30);
}

// void sum(num1, num2) {
//   print(num1 + num2);
// }



///课程从 1h56分左右开始讲解:
///https://www.bilibili.com/video/BV1vZ4y1x7AS/?p=3&spm_id_from=pageDriver&vd_source=9d2ff4daa93ba2f65d04081137bf4e05