import 'dart:io';

void main(List<String> args) {
  print('main--start');

  /// 1.模拟发送一个网络请求
  var result = getNetWorkData();
  result.then((value) => {
    print('then 回调拿到结果---$value')
  }).catchError((error) => {
    print('catchError 回调拿到结果--$error-')
  });
  print(result);
  print('main--end');
}

Future<String> getNetWorkData() {

  ///Future() 构造函数传入一个耗时的回调函数操作.
  /**
   * Future(() {
   *   /// 消时操作.
   *   拿到结果后返回
   * })
   */

  ///2.Future 把耗时的操作包裹到Future 中. 跟 Promise 用法一样.
  return Future(() {
    sleep(Duration(seconds: 2));
    throw Exception("❌");
    return "Hello";
  });
}
