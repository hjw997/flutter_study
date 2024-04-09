import 'dart:io';

void main(List<String> args) {
  print('main--start');

  /// 1.模拟发送一个网络请求
  var result = getNetWorkData(); /// 阻塞主线程
  print(result);
  print('main--end');
}

String getNetWorkData() {

  ///2.Future 把耗时的操作包裹到Future 中. 跟 Promise 用法一样.
  sleep(Duration(seconds: 2));

  return "Hello";
}
