main(List<String> args) {

  final superman = SuperMan();
  superman.running();

  final dog  = Dog();
  dog.run();
}

/// Dart中没有哪一个关键字是来定义接口的
///
/// 没有这些关键字interface/protocol 接口名 这样定义的.
///
/// 默认情况下所有的类都是隐式接口-如果是接口 那么这些方法就是抽象的对于实现类,所以实现类必须实现.
/// Dart支持单继承
///
/// 当 将一个类当做接口使用时, 那么实现这个接口的类, 必须实现这个接口中所有方法 ⭐️⭐️⭐️⭐️
abstract interface class  Runnable {
  /// 抽象修饰的可以有抽象方法.
  void run();
}

interface class  Runnable1 {
  /// 不可以抽象方法.
  //void run1();
  void run2(){
    print("Runnable-1-");
  }
}

/// 当 将一个类当做接口使用时, 那么实现这个接口的类, 必须实现这个接口中所有方法
class Dog implements Runnable,Runnable1 {

  @override
  void run() {
    print("Dog --run");
  }

  @override
  void run2() {
    // TODO: implement run2
    /// super.run2(); 这里 不可以调用"接口" 中的 super,因为隐式接口是抽象的.
  }
}

class Runner {
  void running() {
    print("Runner-running");
  }
}


class Flyer {
  void flying() {

  }
}

class Animal {
  void eating() {
    print("动物次东西");
  }

  void running() {
    print("Animal-running");
  }
}

/// 当 将一个类当做接口使用时, 那么实现这个接口的类, 必须实现这个接口中所有方法
class SuperMan extends Animal  implements Runner, Flyer {
  @override
  void eating() {
    super.eating();
  }
  @override
  void running(){
    super.running();
    print("SuperMan---running");

  }

  /// 所以为什么 flying 必须实现,因为 SuperMan 父类中没有.所以这里必须实现.
  @override
  void flying() {
    /// 调用的是 哪一个? 父类还是 接口中的呢?---父类的.
    /// 默认情况下所有的 类都是隐式接口-如果当做接口,那么这些方法就是抽象的,对于实现类,所以实现类必须实现.
    /// ⭐️⭐️⭐️⭐️
    //super.flying();
  }
}



