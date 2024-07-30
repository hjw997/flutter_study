main(List<String> args) {

  /// 常量构造函数 调用不再是new 而是 const , 但 const 也可以省略.
  const p_1 = const Person("why");
  /// 常量构造方法 创建的对象,如果将结果赋值给 const 修饰的标识符时,const 可以省略.
  const p_2 = Person("why");
  /// 常量构造函数创建出来的对象 属性值一样,创建对象就是指向同一块内存的.
 print(identical(p_1, p_2));

  const p1 = Person1("why", 20);
  const p2 = Person1.withAgeAndName("why",20);
  print(identical(p1, p2));///true

}

class Person {
  /// ⭐️⭐️⭐️⭐️ 拥有常量构造方法的类中,所有的成员变量必须是 final 修饰的.
  final String name;
  /// 常量构造函数创建出来的对象 属性值一样,创建对象就是指向同一块内存的.
  const Person(this.name);
}

class Person1 {
  final String name;
  final int age;

  /// 常量构造函数创建出来的对象 属性值一样,创建对象就是指向同一块内存的.
  const Person1(this.name, this.age);
  const Person1.withAgeAndName(this.name,this.age);

}


