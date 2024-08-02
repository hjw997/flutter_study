/**
 * 1.补充一: as 关键字给库起别名
 * 2.补充二: 默认情况下载导入一个库时, 导入这个库中所有的内容
 *    * show: 执行要导入的内容
 *    * hide: 隐藏某个要导入的内容, 但是导入其它内容
 */

import 'utils/math_utils.dart' as mUtils;

import "utils/math_utils.dart" show sum, mul;
import "utils/math_utils.dart" hide mul;

main(List<String> args) {

  print(sum(20, 30));

  print(sum(20, 30));

  min(20, 30);
  mul(20,20);
}



