
import "utils/utils.dart";

main(List<String> args) {
  print(sum(10, 20));

  /// 区分私有:私有的外界无法调用.
  // _plus(20, 30);
  plus(20, 30);
}
