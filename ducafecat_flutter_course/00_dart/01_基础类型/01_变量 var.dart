void main(List<String> args) {
  test01();
}

//默认值都是 null .
void test02() {
  /// 变量声明后默认都是 null
  String a;
  bool b;
  var c;
  dynamic d;
  print("----");
}

/// 1.弱类型:
void test01() {
  //弱类型: var object

  /// 变量声明后默认都是 null
  var a;

  //var a = "";

  a = "hello";
  //a = 123;
  //var 只要给初始值,就确定类型了. 以后不是同类型就报错

  //Object 任何类型都可以
  Object b = "hello";
  b = 123;

  ///b.call(); 编译期间就报错了.

  /// Object 任何类型都可以
  ///
  dynamic c = "abc";
  c = 123;
  c.call123(); ///❌ NoSuchMethod. 
  //dynamic 在运行的时候才会去检测类型,如果方法不存在就会崩溃.
}

/**
 * 插件 Colonize

可实现效果：
mac:opt-option  win: alt-option

`shift+enter` 句尾补分号并将光标停留在句尾；

`opt+enter` 句尾补分号并新建一行；

`ctrl+opt+enter` 句尾补分号但光标停留在原处。
 *
 */
