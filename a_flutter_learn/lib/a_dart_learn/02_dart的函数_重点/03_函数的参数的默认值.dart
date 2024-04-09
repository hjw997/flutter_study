/// 44分开始:
/// https://www.bilibili.com/video/BV1kh411a7Lr/?p=2&spm_id_from=pageDriver&vd_source=cb6ae6706090bf4b58988509a26a517c
void main(List<String> args) {
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

/// 1.必选参数--不能有默认值,因为必须在调用的时候必须要传入一个参数过来. 默认没有意义.
// void sayHello1(String name = "Rose") {
//   print("hello $name");
// }
void sayHello1(String name) {
  print("hello $name");
}


/// 可选参数: 分为位置可选[] -  命名可选参数 {}
/// ✅ :  只有可选参数才有默认值. 如下:

/// 位置可选: [ ]
void sayHello2(String name, [int? age = 18, double? height = 1.0]) {}

/// 命名可选参数: { }
void sayHello3(String name, {int? age = 20 , double? height = 188}) {}
