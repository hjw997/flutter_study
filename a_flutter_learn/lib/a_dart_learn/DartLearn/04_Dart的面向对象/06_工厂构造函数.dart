main(List<String> args) {

  /// PS 报错❌原因:
  ///小细节: 如果前面 使用 const 修饰,那么构造函数必须是 const 的常量构造函数. ⭐️⭐️⭐️⭐️ ⭐️⭐️⭐️⭐️
  //const p_1 = Person.withName("why");
  //const p_2 = Person.withName("why");

  /// 使用 final 就像 swift 用 let , kotlin 用val . 更安全. 如果需要修改 就用 var .
  final p1 = Person.withName("why");
  final p2 = Person.withName("why");
  print(identical(p1, p2));
}

/**
 * 需求:传入相同的 name 时,那么返回的对象是同一个,
 *     传入的color相同时,返回的对象是同一个.
 *     Person0 是无法满足的.
 */

// class Person0 {
//   final String name;
//   final String color = "red";
//
//   //const Person0(this.name);
//   ///'color' is final and was given a value when it was declared, so it can't be set to a new value.
//   /// const Person0(this.color, this.name);
// }


/// 普通的构造函数: 会自动返回创建出来的对象, 不能手动的返回 构造方法中 return this.
/// 工厂构造函数最大的特点: 使用 factory 修饰, 可以手动的返回一个对象 ⭐️⭐️⭐️⭐️ ⭐️⭐️⭐️⭐️
///                     无论是你自己创建的还是从别的地方获取的都可以.
class Person {
  String name;
  String color;

  static final Map<String, Person> _nameCache = {};
  static final Map<String, Person> _colorCache = {};

  /// PS 一旦自己实现构造函数,无论是 普通构造  命名构造函数,那么系统默认的构造函数是不会存在的 , Person() 不会存在.
  Person(this.name, this.color);/// 普通构造函数

  /// factory 修饰 , 工厂构造 ⭐️⭐️⭐️⭐️ ⭐️⭐️⭐️⭐️
  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name] ?? Person("abc", "color");
    } else {
      /// Person(); Person() 不会存在.
      final p = Person(name, "default");
      _nameCache[name] = p;
      return p;
    }
  }

  /// 工厂构造 ⭐️⭐️⭐️⭐️ ⭐️⭐️⭐️⭐️
  factory Person.withColor(String color) {
    if (_colorCache.containsKey(color)) {
      return _colorCache[color] ?? Person("abc", "color");
    } else {
      /// Person(); Person() 不会存在.
      final p = Person("default", color);
      _colorCache[color] = p;
      return p;
    }
  }

}

