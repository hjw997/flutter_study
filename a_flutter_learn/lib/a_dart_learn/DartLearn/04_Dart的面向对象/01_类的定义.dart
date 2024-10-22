main(List<String> args) {
  var p = Person0("why", 18);
}

///类的定义.
class Person0 {
  String name;
  int age;

  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  ///  语法糖:🍬🍬🍬
  /// 上面的构造函数 内部都是给 成员变量赋值,干脆就写在 构造方法中
  Person0(this.name, this.age);
}

