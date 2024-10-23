main(List<String> args) {
  /// 1.  ??=
  /// 当原来的变量有值时, 那么 ??= 不执行
  /// 原来的变量为null, 那么将值赋值给这个变量

  var name = null;
  name ??= "lilei";
  print(name);

  /// 2.  ??
  /// ??前面的数据有值, 那么就使用 ?? 前面的数据
  /// ??前面的数据为null, 那么就使用后面的值
  var name1 = null;
  /// 类似 ====> kotlin 中的  a ?: b  a为null 就用b.
  /// 把name1 赋值给别人的时候 用name1 还是 ?? 后的.
  var temp = name1 ?? "lilei";
  print(temp);
}

/**  区别:
 *  a ??= b  是赋值. a为空就把b赋值给 a
 *  a ?? b   是取值 a 为空 就取b 执行.
 */