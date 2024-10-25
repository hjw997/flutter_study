import 'dart:io';

void main(){
  print("main---start");

 //var result = getNetworkData(); /// 阻塞等待结果.
 // print(result);

  var future = getNetWorkData2();
  /// 2拿到结果:
  /// then后面的回调函数什么时候被执行呢?
  /// 需要等到 Future(耗时函数) 中的耗时匿名函数有结果,才执行下面的then中的回调函数.
  future.then((value) {
    /// 2. Future 的then 中拿到结果.
    print("拿到结果:$value");
  }).catchError((error) {
    /// 如果这个Error 不处理就会抛到虚拟机. -- Unhandled exception:
    print(error);
  }).whenComplete((){
    print("代码执行完毕");
  });

  print("main---end");
}

/// 1.模拟一个网络请求 ---耗时 阻塞线程.
String getNetworkData() {
  /// 阻塞线程:
  sleep(const Duration(seconds: 2));
  return "Hello";
}

/// 使用Future 把耗时操作包裹到 Future中.
Future<String> getNetWorkData2() {
  /// Future用法: ⭐️⭐️⭐️⭐️
  ///
  return Future(() {
    /// 1.传入一个匿名回调函数,函数中写耗时的操作.
    /// 1> 只要有返回结果,那么就执行Future对应的then的回调.(相当于 Promise中的resolve 调用会去执行 then回调. )
    /// 2> 如果没有结果或者有错误信息,需要在Future 回调中抛出一个异常( Promise-reject 调用会去执行 catch 回到)
    sleep(const Duration(seconds: 2));
    //return "Hello";

    /// Exception 构造方法是个位置可选参数
    throw Exception("网络错误了");
  });
}
