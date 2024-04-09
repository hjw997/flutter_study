/// 38分开始:
/// https://www.bilibili.com/video/BV1kh411a7Lr/?p=2&spm_id_from=pageDriver&vd_source=cb6ae6706090bf4b58988509a26a517c
void main(List<String> args) {
  /// dart 没有函数重载(方法名称相同,参数不同)

  /// 1. 必选参数
  sayHello1("jack");

  /// 2. 位置可选:
  ///sayHello2("Rose",18.8); ///位置对应的参数要类型匹配.根据位置去匹配
  sayHello2("Rose", 18);

  /// 3.命名可选参数 使用 必须要有名字.
  sayHello3("Jack");
  /// 第一个参数是必选参数
  /// 如果传参的话 , age 不能省略,
  sayHello3("Rose", age: 20);
  /// 命名可选的参数的顺序无所谓.
  sayHello3("Jack", height: 188, age: 25);

}

/// 1.必选参数--调用时候必须传入
void sayHello1(String name) {
  print("hello $name");
}

/// 可选参数: 分为位置可选[] -  命名可选参数 {}

/// 位置可选:[int age,double height]
/// 实参和形参在进行匹配是,是根据位置来匹配.
void sayHello2(String name, [int? age, double? height]) {}

/// 命名可选参数: 使用 {}
void sayHello3(String name, {int? age, double? height}) {}
