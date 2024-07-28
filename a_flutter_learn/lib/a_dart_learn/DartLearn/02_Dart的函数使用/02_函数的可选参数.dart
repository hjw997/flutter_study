/***
 * 重要:函数的可选参数
 *
 */

main(List<String> args) {
  sayHello1("why");

  sayHello2("why", 18); ///位置可选:--实参和形参在进行匹配时,根据位置来匹配.

  ///命名可选参数必须要有名字来匹配--顺序无所谓.
  sayHello3("why", height: 1.88);
  sayHello3("coderwhy",age: 25);
  sayHello3("lmj",age: 20,height: 180.0);

  sayHello4("coder");


}


/// 必选参数: 必须传
void sayHello1(String name) {
  print(name);
}

/// dart中没有函数的重载--也就是方法名称相同参数不同.
///
/// 可选参数分为:
/// 位置可选参数 - 命名可选参数
/// 注意: 只有可选参数才可以有默认值
///
/// 位置可选参数: [int age, double height]
/// 实参和形参在进行匹配时, 是根据位置来匹配-调用时对应的位置上的类型就得匹配.
void sayHello2(String name, [int age = 10, double height = 2]) {

}

/// 命名可选参数 使用 {} ,---开发用的最多.
void sayHello3(String name, {int age = 10, double height = 3.14}) {

}


/// 函数参数可以有默认值---只有可选参数才能有默认值,如果给 name 默认值就报错❌.
/// 如果可选参数不给默认值,是null 的时候 就得加 类型? 这样说明是个可null 的类型.
/// void sayHello4(String name = "aaa" ❌,{int? age,double height = 1.80}) {
void sayHello4(String name,{int? age,double height = 1.80}) {
  print('age is : $age height is $height' );
}
