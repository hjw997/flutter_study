main(List<String> args) {
  ///❌ 抽象类不能实例化:
  //final s = Shape();

  /// 但是我们发现Map 也是抽象的 怎么可以实例化呢??
  /// external factory Map();
  /// 因为有工厂构造方法.
  final map = Map();
  print(map.runtimeType);

  /// PS: 现在版本的 dart 没有 List() (unnamed Construct).
  /// 内部都是工厂命名函数.
  /// final List<String> list  = List();
  // print(list.runtimeType);


  /// 那么我们也尝试一下 Shape 用个抽象方法. Shape0 这个类
  /// final shape0 = Shape1.shape();

}


/// 注意二: 抽象类不能实例化
abstract class Shape {
  ///抽象类可以只有方法申明.
  int getArea();
  /// 也可以有实现.
  String getInfo() {
    return "形状";
  }
  Shape();

  /// 此处的工厂构造方法可以返回一个 子类的实例对象.
  factory Shape.factory() {
    return Rectangle();
  }
}

/// 注意一: 继承自抽象类后, 必须实现抽象类的抽象方法
class Rectangle extends Shape {
  @override
  int getArea() {
    return 100;
  }
}

///
abstract class Shape0 {
  ///抽象类可以只有方法申明.
  int getArea();
  /// 也可以有实现.
  String getInfo() {
    return "形状";
  }
  Shape0();

}
class Rectangle0 extends Shape0 {
  final int width;
  final int height;

  Rectangle0(this.width, this.height);

  @override
  int getArea() {
    return width * height;
  }
}


abstract interface class Shape1 {

  /// external 让方法的声明和方法的实现分离.
  /// 方法的实现 用注解 @patch  补丁来实现.
  /// ⭐️⭐️⭐️⭐️ 好处是 针对不同的平台去实现.
  external factory Shape1.shape();
}

/**
 * 网上搜寻一番 发现 这个注解只有 sdk 内部的私有的.
 */
// @patch
// abstract final class class Shape1 {
//
//   @patch
//   factory Shape1.shape(){
//     return Rectangle00(20,20);
//   }
//
// }
