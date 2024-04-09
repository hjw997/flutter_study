void main(List<String> args) {

    var person = Person.from("rose",age: 22);
    print(person);


}

class Person {
  final String name;
  final int age;

  /***
      ///Non-nullable instance field 'age' must be initialized.
      Person(this.name)/// 因为 这个里执行完表示这个对象已经初始化完毕了.
      /// 所以要保证执行 初始化 所有的成员属性才能走 大括号内容.
      {
      this.age = 10; /// 这里不是初始化了吗?
      }
   */

    ///初始化列表:

    /// 初始化列表: 冒号后面的 比如如果 外界给传值了就用外界传的值,否则就自己初始化一个.
    Person(this.name, {int? age}) : this.age = age ?? 10 ; /// 多个初始化列表就 逗号 ,分割.

    /// 如果是默认值 只能给具体值 ,不能是表达式: -- 只有可选参数才有默认值.
    Person.from(this.name, {this.age = 10}); ///命名可选 - 默认值方式. --这种方式局限性.
    /// 😋 三元运算符 不可以写到 命名可选参数这里, 但是可以写到初始化列表中. .

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }
}
