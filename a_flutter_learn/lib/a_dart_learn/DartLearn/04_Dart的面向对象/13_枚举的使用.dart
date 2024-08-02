// 枚举: enum
main(List<String> args) {
  final color = Colors.red;

  switch (color) {
    case Colors.red:
      print("红色");
      break;
    case Colors.blue:
      print("蓝色");
      break;
    case Colors.green:
      print("绿色");
      break;
  }

  /// 所有的枚举都有一个 values 属性,获取到这个枚举类型所有的枚举类型.
  print(Colors.values);/// [Colors.red, Colors.blue, Colors.green]

  /// 每个 枚举值 都有一个 索引值.
  print(Colors.red.index);
}


/// dart 中的枚举.
enum Colors {
  red,
  blue,
  green
}




