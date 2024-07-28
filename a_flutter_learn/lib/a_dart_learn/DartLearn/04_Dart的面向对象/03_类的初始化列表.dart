main(List<String> args) {
  var p = Person("why", age: 30);
  print(p.age);
}

const temp = 20;

class Person {
  final String name;
  final int age;
  final int age1 = 10; ///如果这里写了以后就不能再改了.

  // Person(this.name) {
     /// 来这里时候对象已经初始化完毕这里太晚了.
  //   this.age = 10;
  // }

  /// 初始化列表 用的较多的一种方式: 多个参数用 逗号 分割.
  /// 判断有没有传入东西过来,没有就用初始化列表的 10 .
  Person(this.name,{int? age}): this.age = age ?? 10 {

  }

  // Person(this.name, {int age = 10}): this.age = age {
  //   /// 初始化的其他代码....
  // }
  /// 上的代码简化为如下:但是这个默认值的方式这里不能写表达式.
  Person(this.name, {this.age = 10}) {
    /// 初始化的其他代码....
  }


  /// 如果创建对象时, 有传入一个age, 那么就使用传入的age, 如果没有传入age, 那么使用一个默认值
  Person(this.name, {int age}): this.age = temp > 20? 30: 50 {
  }
  // Person(this.name, {this.age = temp ?? 30});

  // 保留
  // Person(this.name, {this.age = 10});
}

