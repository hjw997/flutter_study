main(List<String> args) {
  final p = Person();

  /// 直接访问属性
  p.name = "why";
  print(p.name);

  /// 通过getter和setter访问
  p.setName = "lilei";
  print(p.getName);

  print(p._age);
  p.setAge = 20;

}


class Person {
  String name = "";
  /// 加了 _ 下划线 访问权限变为了  本模块中 可访问  . 其他模块私有.
  int  _age = 0;

  /// 比如监听属性的访问:⭐️⭐️⭐️⭐️
  /// setter
  set setAge(int age) {
    this._age = age;
  }
  int get getAge {
    return this._age;
  }
  /// 使用箭头函数 简化.
  set setName(String name) => this.name = name;
  /// getter 不能写return 箭头函数中.
  String get getName =>  name;
}