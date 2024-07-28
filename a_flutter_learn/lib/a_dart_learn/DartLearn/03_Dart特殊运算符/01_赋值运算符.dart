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
  /// 把name1 赋值给别人的时候 用name1 还是 ?? 后的.
  var temp = name1 ?? "lilei";
  print(temp);
}