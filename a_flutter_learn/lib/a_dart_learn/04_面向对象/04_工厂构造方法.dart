class Person {
  String? name;
  int? age;
  double? height;

  Person({this.name, this.age, this.height});

  /// 工厂构造:比如这个类是个抽象的不能初始化实例,
  /// 可以通过 一个工厂构造返回一个实现了这个抽象类的实例对象.
  factory Person.makePerson() {
    return Person();
  }

  /// 命名构造方法:因为 dart 没有方法重载.
  Person._internal(this.name);

  @override
  String toString() {
    return 'Person{name: $name, age: $age, height: $height}';
  }
}

void main() {
  var p1 = Person._internal("james");
  var p2 = Person.makePerson();
  print(p2);
}
