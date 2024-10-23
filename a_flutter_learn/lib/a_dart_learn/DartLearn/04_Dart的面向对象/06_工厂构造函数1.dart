
/// 工厂构造函数:
/// 通过 factory 申明,工厂函数不会自动生成实例(也就是 不能用new 来创建),而是通过代码决定返回的实例.

void main(List<String> args) {
   var p1 =  Person("caocao");
   var p2 =  Person("caocao");
   print(p1 == p2);
}

class Person {
  /// late 延迟初始化 不能是 null 注意这点所以也就不能判断是不是 null .
  //static late Person _instance;
  /// 工厂构造函数不能返回null --这里就是模仿一个单例模式:
  // factory Person([String? n]) {
  //   //return _cache[n] ?? Person.newSelf(n);
  //   if(_instance == null) { /// 抛异常没有初始化;
  //     _instance = Person._newSelf(n);
  //   }
  //   return _instance;
  // }


  /// 这样就是一个单例:
  static late  Person _instance ;
  factory Person([String? name]){
    if(name != null){
      _instance = Person._newSelf(name);
    }else {
      _instance = const Person._newSelf("caocao");
    }
    return _instance ;
  }
  final String? name;

  /// 命名构造函数 可以创建对象.
 const Person._newSelf(this.name);
}

