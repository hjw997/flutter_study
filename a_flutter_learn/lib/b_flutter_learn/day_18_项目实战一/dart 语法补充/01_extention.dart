

class Person {

}

/// on 是对谁扩展
extension PersonE on Person {

}

/// 扩展语法:
// extension 扩展名  on  要扩展的类 {
//    方法:
// }

/// 对系统的类扩展 String / int / double
extension StrSplit on String {
  /// 通过什么分割字符串 separator 分割符
  List<String> hySplit(String separator) {
    return split(separator);
  }
}


void main() {
   var message = "H-e-l-l-o-Wo-rl-d";
   var result = message.hySplit("-");
   for (var element in result) {
     print(element);
   }
}


