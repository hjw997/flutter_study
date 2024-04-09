void main(List<String> args) {
  var person1 = Person("rose", 18);

  var person2 = Person("Jack",20,height: 188.0);

  /// ps: 这个不是类方法 是构造方法 ,因为前面可以 new . new 也可以省略的.
  var person3 = new Person.withNameAgeHeight("rose", 20, 150.0);

  var map = {
    "name":"rose",
    "age":21,
    "height":135.2
  };
  var person4 = Person.fromMap(map);
  print(person4);




}

class Person {
  String name;
  int age;
  double? height;

   /// --- height 参数使用命名可选参数.
   Person(this.name,this.age,{this.height});
   /// 因为 dart 中没有重载函数
   /// 还有一个中方式命名构造函数  : PS 这是一种构造函数
   /// withNameAgeHeight 名字可以随便起.但是见名知意
   Person.withNameAgeHeight(this.name,this.age,this.height);

   /// 使用一个字典 来构造对象 dynamic 是 一种类型. 相当与 Any 类型.
   Person.fromMap(Map<String,dynamic> map)
       : this.name = map["name"], this.age = map["age"], this.height = map["height"] /// 可以用初始化列表初始化.
   {
     // this.name = map["name"];
     // this.age = map["age"];
     // this.name = map["height"];
   }

  @override
  String toString() {
    return 'Person{name: $name, age: $age, height: $height}';
  }
}

/**
 * dynamic 是: Any 类型,运行时候 可以最终确定具体类型.运行时候方法不存在会报错.
 * Object 是 具体的类. 所有类继承 Object , 调用一个不是这个类的方法,会编译期间拨错.
 * ps: dynamic 是一种明确类型,运行时 可以判断.
 * . var 是 类型推导出来的.
 */