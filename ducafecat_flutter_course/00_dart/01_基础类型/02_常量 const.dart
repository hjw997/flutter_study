/// 学习目标:
/// 1. final 和 const 相同点, 不同点:
/// 2. 开发使用场景
///
///
void main(List<String> args) {
  /// dart 中的常量有 final  和 const 修饰的
  /// 相同点 1.声明类型可以省略
  final a = "abc";
  const b = "abc";

  /// TIPS : ctr + opt 可以弹出 变量的类型. ✅
  /// 2.初始化后不能在改变了
  //b = "aaa";
  //a = "bbb";

  /// 3.不能和 var 同时使用 : Members can't be declared to be both 'final' and 'var'.
  //final var c = "ddd";
  // const var c = "ddd";

  /// 不同点:
  /// final 可以使在运行时候 得到值.
  final dt = DateTime.now();

  /// const 修饰的需要确定的值,也就是在编译前就要确定类型.
  // const dt2 = DateTime.now();

  //const 不可变性,可传递
  final ls = [1, 2, 3];
  ls[2] = 33;

  /// const 修饰的不可以修改.
  const ls2 = [1, 2, 3];
  //ls2[2] = 88; ///UnsupportedError (Unsupported operation: Cannot modify an unmodifiable list)

  ///内存中是否重复
  /// identical(a, b) 这个函数是用来判断 两个对象的内存中地址是否一致.
  final f1 = [11, 33];
  final f2 = [11, 33];
  print(identical(f1, f2)); //false

  const c1 = [11, 22];
  const c2 = [11, 22];
  print(identical(c1, c2));

  /// final 场景就是 需要初始化的成员变量. 比如模型里面的属性等. 运行时候确定的
  ///
  /// const 比如全局常量字符串,资源图片字符串名称等,
  /// > static const storageFirstOpen = 'first_open';
  /// 还有一个就是 flutter 中 经常的组件 const 修饰,这样这个组件就是同一个,可以复用,从而减少内存开销.
  /// > const SizeBox(width:10);  这样的 如果内存有就不会再去创建,节省内存开销.
  ///
}
