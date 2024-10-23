



///   理解函数是一等公民:
///   也就是 函数是一个单独的类型  那么既然是 类型
///   就可以当参数 ,当返回值, 申明函数类型的变量.

main(List<String> args) {
  /// 1.直接找到另外一个定义的函数传进去
  /// test(bar);

  /// 2.匿名函数:  (参数列表) {函数体};
  test(() {
    print("匿名函数被调用");
    return 10;
  });

  /// 3.箭头函数: 条件:  匿名函数的 函数体 只有一行代码 ,这一行代码不能加 分号.
  /// (参数列表) => { 函数体只能一行 ,且不能加分号结尾 }
  test(() => {
    print("箭头函数被执行")  /// 这一行代码不能加 分号 ;
  });
  /// 省略大{}
  test(() =>  print("箭头函数被执行---") );

  /// 匿名函数好处:将函数作为参数传递.
  ///
  ///实际开发中:
  testFun((int num1,int num2){
    return num1 + num2;
  });

  testFun1((int num1,int num2){
    return num1 + num2;
  });

  /// 返回一个函数类型-取出函数.
  final calc = demo();
  /// 继续调用这个返回的函数.
  calc(10,20);
}

// 函数可以作为另外一个函数的参数
void test(Function foo) { ///开发中不建议直接写Function 没有对函数做限制:
  var result = foo();
  print("object==$result");
}

/// 实际开发中如果需要传入一个函数
/// 参数是函数类型:
void testFun(int block(int num1,int num2)) { /// 最好给函数签名:⭐️⭐️⭐️⭐️
  final result  = block(1 , 2);
  print("返回结果:$result");
}

/// 最新的语法:--貌似使用时候提示不友好.
void testFun1(int Function(int a ,int b)  block) {
  final result  = block(1 , 2);
  print("返回结果:$result");
}

/// 推荐:⭐️⭐️⭐️⭐️⭐️⭐️⭐️ typedef
///上面的函数类型参数还是不好阅读 那么使用 typedef
/// 将函数签名做个声明:
typedef Calculate = int Function(int,int);
void testFun2(Calculate calc) {
  calc(20,30);
}

/// 返回值是函数类型 ⭐️⭐️
Calculate demo() {
  ///返回一个函数类型:
  return (num1, num2) {
    return num1 * num2;
  };
}
void bar() {
  print("bar函数被调用");
}
