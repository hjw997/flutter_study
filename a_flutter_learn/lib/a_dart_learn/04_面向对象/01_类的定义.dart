void main(List<String> args) {
  /// 创建对的 new 关键字 从 dart 2.0 可以省略
  var person1 = new Person("jack", 18);
  print(person1);

  var person2 = Person("rose", 18);
  print(person2);


}

class Person {
  String name;
  int age;

  /// 这个报错是因为 Person(String name,int age) 以后 这个对象就已经创建完了.
  // Person(String name,int age) {
  //   this.name = name;
  //   this.age = age;
  // }

   /// 上面的代码 的语法糖 写法. 更加简洁
   Person(this.name,this.age);

}
