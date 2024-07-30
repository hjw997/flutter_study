main(List<String> args) {
  var p = Person("why");
  print(p.age);
  var p1 =  Person._internal("name", 20);
  print(p1.name);
}


class Person {
  String name;
  int age;

  // Person(this.name): age = 0;
  /// 构造函数的重定向 ---这个构造中去调用另一个构造函数就叫构造函数的重定向.
  Person(String name): this._internal(name, 0);
  /// 这个也是个构造函数-命名构造函数
  Person._internal(this.name, this.age);
}