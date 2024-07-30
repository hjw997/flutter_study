main(List<String> args) {
  var p = Person("why", age: 30);
  print(p.age);
}

const temp = 20;

class Person {
  final String name;
  final int age;
  /// 这种构造方法 报错是因为 构造的 大括号时候 对象已经初始化完了,
  /// 而final 修饰的成员变量,就是对象初始化后必须赋值.
  Person(String name, int age) {
    /// it is  too late
    this.age = age;
    this.name = name;
  }
}

class Person0 {
  final String name;
  final int age;
  /// 这种构造方法:语法糖.
  Person0(this.name, this.age);
  /// 如果构造体没有代码可以 省略 {} .
}

class Person1 {
  final String name;
  final int age;
  //final int age1 = 10; ///如果这里写了以后就不能再改了(那还有什么意义).
  /// 初始化列表: 这种方式冒号后可以写很多表达式.
  Person1(this.name,{int? age}): this.age = age ?? 10;
}
class Person2 {
  final String name;
  final int age;
  /// 这种初始化方式:构造中用了命名可选,如果外界没传,那么就用 10 . 传了就用外界给的.
  Person2(this.name,{ this.age = 10});
}


//var tempValue = 10;
//final tempValue = 10;
const tempValue = 10;

class Person3 {
  final String name;
  final int age;
  /// 这里虽然可以写 表达式,但是这个表达式必须是常量的赋值操作. 必须是 const 也就是编译期间确定的值.
  Person3(this.name,{this.age = tempValue > 20 ? tempValue : 25});

}

// var tempValue2 = 10;
final tempValue2 = 10;
// const tempValue2 = 10;
int testabc(){
  return 20;
}
class Person4 {
  final String name;
  final int age;
  /// 这种冒号后面的 无论是var final const 以及函数等调用 初始化列表可以写各种表达式. 所以 flutter 代码中 大量使用.⭐️⭐️⭐️⭐️
  Person4(this.name, {int? age}): this.age = tempValue2 > 20? 30: testabc();
}

/**
 * 本节重点:理解什么情况下用 :
 * 1.  Person(this.name, {this.age = 10}) /// 这种方式 只能写一个常量赋值. 
 * 2.  Person(this.name,{int? age}): this.age = age ?? 10 //初始化列表:后可以写各种表达式.
 * 这两种初始化方式.
 */

