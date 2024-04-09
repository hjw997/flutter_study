/// 什么叫一等公民? 在面向对象的语言中 对象是一等公民(可以作为实例对象,参数,返回值等传递)
/// dart 中函数也是一种类型.
void main(List<String> args) {

  /// 1. 直接传入一个函数 bar 进去.
  test(bar);

  /// 2.传入一个匿名函数. 匿名函数做参数好处就是不用再去单独定义一个函数
  test((){
    print("匿名函数被--调用");
    /// 如果有返回值就加上:
    return 10;
  });

  /// 箭头函数:条件: 函数体只有一行代码,一句后面都不能有分号.. ps 和 ES6 中的语法有些不一样.
  test( () => print("=> 箭头函数被调用") );

}

/// 函数可以作为另外一个函数的参数:
void test(Function foo) { /// 参数类型是个 Function 类型的
   var result =   foo(); /// 如果函数调用结果没有返回值 就是 null
   print(result);
}
void bar(){
  print("bar-函数被调用");
}