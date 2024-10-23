abstract class Person {
  String? name;
  int? age;
  double? height;

  Person({this.name, this.age, this.height});

  /// 工厂构造:比如这个类是个抽象的不能初始化实例,
  /// 可以通过 一个工厂构造返回一个实现了这个抽象类的实例对象.
  factory Person.makePerson() {
    return Student();
  }

  /// 命名构造方法:因为 dart 没有方法重载.
  Person._internal(this.name);

  @override
  String toString() {
    return 'Person{name: $name, age: $age, height: $height}';
  }
}
class Student extends Person {

}

/// 单例模式:
class Singleton {
  /// 加了下滑线 开头就是 模块私有 ,dart 中一个文件就是一个模块.
  String _name;
  static final Singleton _singleton = Singleton._internal("abc");

  factory Singleton() {
    return _singleton;
  }

   Singleton._internal(this._name);
}

class Employee {
  String? name;
  //Employee._() {} 私有外界无法访问
  Employee._(this.name); ///外界也是无法访问的.

  Employee._withName(this.name);
}

void main() {
  //var p1 = Person._internal("james");
  var p2 = Person.makePerson();
   print(p2);
   Singleton._internal("aaa");
  /// 下划线开头的 模块以外是访问不了的.
  Employee._("abc");
  Employee._withName("abc");
}
