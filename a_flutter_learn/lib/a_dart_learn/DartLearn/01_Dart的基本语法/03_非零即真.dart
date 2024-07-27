main(List<String> args) {
  var flag = "abc";
  /// dart中没有非零即真 的说法. 必须是bool 类型.
  if (flag) { /// 必须是bool 类型.Conditions must have a static type of 'bool'.
    print("执行代码");
  }
}