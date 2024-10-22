main(List<String> args) {

  var p0 = Person0("coder", 20);
  print(p0);


  /// 1.创建Person对象
  var p_ = new Person.withNameAgeHeight("why", 18, 1.88);
  /// 命名构造函数 其实也是构造函数 也是用 new 的 但是构造函数的new 可以省略.
  /// PS:这里也是一种构造方法:
  var p = Person.withNameAgeHeight("why", 18, 1.88);
  print(p.toString());

  var p1 = Person.fromMap1({
    "name": "lilei",
    "age": 18,
    "height": 1.88
  });
  print(p1);

  /// 2.知识点补充: Object和 dynamic 的区别
  /// 父类引用指向子类对象
  /// Object 和 dynamic
  /// Object调用方法时, 编译时会报错
  /// dynamic调用方法时, 编译时不报错, 但是运行时会存在安全隐患

   Object obj = "why";
   /// print(obj.substring(1)); ///编译时候报错.

  /// 明确声明的类型: 就是 就类似 Any一样.
  /// 也就是说 dynamic 也就是一种类型 和 swift 的Any类似.
  dynamic obj_d = 123;
  /// print(obj_d.substring(1));///编译时不报错, 但是运行时会存在安全隐患
  ///
  /// 而 var 是类型推导,来申明一个变量的.
  var  t = "abc"; ///var 类型推导为 字符串类型.
}

class Person0 {
  String name;
  int age;
  /// 语法糖构造方法:方法内部就是给成员变量赋值.
  Person0(this.name,this.age);
}

///后续迭代: 新增加一个属性  double height
class Person {
  String name;
  int age;
  double? height;

  Person(this.name, this.age); /// 添加后不破坏以前的构造函数.
  /// Person(this.name, this.age, this.height); //这样很多代码就要改.

  /// 命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  /// 这种成员变量如果 不是 可空类型 就不能这么写了.❌
  // Person.fromMap(Map<String, dynamic> map){
  /// 为什么不能这么写:因为 执行{} 这里面的时候 这个对象已经初始化完毕了,
  /// 成员变量必须在对象初始化时候得到初始化. 这里面来时候已经晚了.
  //   this.name = map["name"];
  //   this.age = map["age"];
  //   this.height = map["height"];
  // }

  ///可以使用初始化列表:
  Person.fromMap1(Map<String, dynamic> map) : name = map["name"], age = map["age"];

  /// 默认情况下 所有的类 都是继承自 Object  的.

  @override
  String toString() {
    return "$name $age $height";
  }
}
