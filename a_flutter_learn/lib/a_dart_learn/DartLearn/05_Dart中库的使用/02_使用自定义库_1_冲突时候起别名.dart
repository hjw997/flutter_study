
/// 1. 导入自己的库: 如果这里自动导入的路径比较复杂可以自己去敲,补全为相对路径.
import "utils/utils.dart" as mUtils; /// ⭐️⭐️⭐️⭐️ 可以使用 as 给 导入的库 起别名.

main(List<String> args) {
  ///0. 比如我们自己封装了一个自己的库 ,  在 utils下 封装自己的 math_utils.dart 库.
  ///
  /// 当出现 2个同名的函数名时候 名字冲突 可以使用 as 给 导入的库 起别名.
  /// print(sum(20, 30));
  print(mUtils.sum(20, 30)); /// ⭐️⭐️⭐️⭐️ 然后使用 别名.方法 调用.

  print(sum(20, 30));

}

int sum(int num1,int num2) => num1 + num2;

/// ????? 报错: The body might complete normally, causing 'null' to be returned, but the return type, 'int', is a potentially non-nullable type.
// int sum(int num1,int num2) {
//   print(num1 +num2);
// }
