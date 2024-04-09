void main(List<String> args) {
  /// 2.传入一个匿名函数.
  test(() {
    print("匿名函数被--调用");
  });

  /// 匿名函数方式:
  test1((num1, num2) {
    /// 不写 return 返回就是 null .
    return num1 - num2;
  });

  /// 箭头函数方式:
  test1((num1, num2) => num1 + num2);
}

/// 比如封装一个方法 参数是 Function 类型, 既要返回值,又要参数?
void test(Function foo) {
  /// 参数类型是个 Function 类型的
  var result = foo();
  print(result);
}
/// PS :Function foo 这种直接写 函数类型 传参数是个函数就能传入.

/// 直接 定义一个函数申明做Function 类型的参数.
void test1(int foo(int num1, int num2)) {
  /// 这种方式的参数 阅读性差.---使用 typedef
  foo(20, 20);
}

// typedef Calculate = int foo(int num1,int num2);
/// 函数名 要写成 Function .
typedef Calculate = int Function(int num1,int num2);
