main(List<String> args) {
  // 1.明确的声明
  String name = "why";

  // 2.类型推导(var/final/const)
  // 类型推导的方式虽然没有明确的指定变量的类型, 但是变量是有自己的明确的类型
  // 2.1.var声明变量
  var age = 20;
  //age = "abc"; //类型推导的方式虽然没有明确的指定变量的类型, 但是变量是有自己的明确的类型
  age = 30;

  /// 2.2.final声明常量--一旦赋值后不可修改.
  final height = 1.88;
  // height = 2.00;
  final weight;
  weight = 20.5; //一旦赋值后不可修改.


  /// 2.3.const声明常量 ---编译期间就必须有确定值.
  const address = "广州市";
  // address = "北京市";

  /// 2.4.final和const的区别
  // const必须赋值 常量值(编译期间需要有一个确定的值)
  // final可以通过计算/函数获取一个值(运行期间来确定一个值)
  //const date1 = DateTime.now(); //写法错误--编译期间必须确定下来.
  final date2 = DateTime.now(); ///final可以在运行期间确定下来.

  /// final用的更多一点
  ///
  final p0 = new Person0("coderwhy"); ///dart 2.0 以后创建不需要 new 关键字了.

  /// p1和p2是不是同一个对象 --因为new 了两次.
  final p10 = Person0("why");
  final p20 = Person0("why");
  print(identical(p10, p20));
  /// 结果为 false 因为new 了两次.

  /// 如果我希望创建的像个单例模式:

  /// 如果我希望 传入的 都一样的时候每次创建出来是同一个对象.
  //const p00 = const Person0("why");
  /// 那么就使用 const 常量构造函数

  /// 在Dart2.0之后, const可以省略,
  //const p1 = new Person("why");不是new关键字.
  const p1 = const Person("why");
  const p2 = const Person("why");
  const p3 = const Person("lilei");

  /// const 常量构造函数构造出来的就是同一个对象.
  print(identical(p1, p2)); /// true ,
  print(identical(p2, p3));

  /// flutter 中很多都是 const 常量,节省内存开销.

  /// dynamic/Object   --- dynamic相当于Any  后面会讲解.
}

class Person0 {
  String name;
  ///构造方法:给那么初始化.
  Person0(this.name);
}

class Person {
  final String name;
  /// 如果这里是常量构造函数 那么所有的成员变量必须是 final 修饰的.
  /// 而且为了保证对象初始化以后 成员必须构造的时候初始化.
  const Person(this.name);
}


