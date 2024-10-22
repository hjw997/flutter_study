main(List<String> args) {
  var p = Person("why", age: 30);
  print(p.age);
}

const temp = 20;

class Person {
  final String name;
  final int age;
  final int age1 = 10; ///如果这里写了以后就不能再改了(那还有什么意义).

  // Person(this.name) {
     /// 来这里时候对象已经初始化完毕这里太晚了.
  //   this.age = 10;
  // }

  /// 初始化列表 用的较多的一种方式: 多个参数用 逗号 分割.
  /// 判断有没有传入东西过来,没有就用初始化列表的 10 .
  /// 冒号后可以可以写一些语句,多个用 , 分开.
  Person(this.name,{int? age}): this.age = age ?? 10 {
    /// 2.  ??
    /// ??前面的数据有值, 那么就使用 ?? 前面的数据
    /// ??前面的数据为null, 那么就使用后面的值

  }

  // Person(this.name, {int age = 10}): this.age = age {
  //   /// 初始化的其他代码....
  // }
  /// 上的代码简化为如下:但是这个默认值的方式这里不能写表达式.
  Person(this.name, {this.age = 10}) { ///这种写法就是赋值语句,只能赋值常量.不能给表达式.
    /// 初始化的其他代码....
  }

  /***
   * PS : 上下两种初始化的区别:
   * 初始化列表 放在冒号后可以写表达式.而上面的就不能写代码一样的表达式,只能写固定常量
   */

  /// 如果创建对象时, 有传入一个age, 那么就使用传入的age, 如果没有传入age, 那么使用一个默认值
  Person(this.name, {int? age}): this.age = temp > 20? 30: 50 {
  }

  /// Person(this.name, {this.age = temp ?? 30});
  /// 这种初始化只能赋值一个常量. temp 是个const 的也就是编译期间就得确定的值.

  // 保留
  // Person(this.name, {this.age = 10});
}


/**
 * ⭐️⭐️⭐️⭐️ 本节重点:理解什么情况下用 :
 * 1.  Person(this.name, {this.age = 10}) /// 这种方式 只能写一个常量赋值.
 * 2.  Person(this.name,{int? age}): this.age = age ?? 10 //初始化列表:后可以写各种表达式.
 * 这两种初始化方式.
 */

