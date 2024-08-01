main(List<String> args) {
  
}

class Animal {
  int age;

  Animal(this.age);
}

class Person extends Animal {
  String name;

  ///调用父类的构造方法 super(xxx)  : 在初始化列表
  Person(this.name, int age): super(age);
}