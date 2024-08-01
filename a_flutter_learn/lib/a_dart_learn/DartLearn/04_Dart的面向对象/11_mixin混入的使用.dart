main(List<String> args) {
  final sm = SuperMan();
  sm.running();
  sm.flying();
}


/// 如果是 隐式接口 方法必须实现
/// 使用混入就可以不必须实现
/// 混入语法:
/// 1.要混入的 不能用 class ,用 mixin .
/// 2.用 with .

mixin Runner {
  void running() {
    print("runner running");
  }
}


mixin Flyer {
  void flying() {
    print("mixin-flying");
  }
}

class Animal {
  void eating() {
    print("动物次东西");
  }

  void running() {
    print("animal running");
  }
}

/// 混入语法:
/// 1.要混入的 不能用 class ,用 mixin .
/// 2.用 with .
class SuperMan extends Animal with Runner, Flyer {
  @override
  void eating() {
    super.eating();
  }

  void running() {
    print("SuperMan running");
  }
}


