main(List<String> args) {
  /// 1.定义字符串--三种方式:
  var str1 = 'abc';
  var str2 = "abc";

  /// 三个引号 ---里面的东西可以换行.
  var str3 = """
  abc
  cba
  nba
  """;

  /// 2.字符串和表达式进行拼接
  var name = "why";
  var age = 19;
  var height = 1.88;
  var message1 = "my name is $name, age is $age, height is $height";

  /// 强调: ${变量}, 那么{}可以省略 如果 ${表达式} {} 不省略.
  /// PS:  变量.runtimeType   获取类型.
  var message2 = "name is $name, type is ${name.runtimeType}";
  print(message1);
  print(message2);
}