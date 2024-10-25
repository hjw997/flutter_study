import 'dart:io';

Future<void> main(List<String> args) async {
  print("main 之前---");

  // var res = await Future.delayed(const Duration(seconds: 3),() {
  //   return "data1";
  // });
  // print("rest--$res");


  getNetWorkData().then((onValue){
    print("then---$onValue");
  });

  print("main 之后---");
}

/// 解决问题: ⭐️⭐️⭐️⭐️
/// async 和 await 其实是个语法糖:
/// 1.await 必须在 async 函数中使用
/// 2.async 返回的结果必须是 Future.
Future getNetWorkData() async {
  print("getNetWorkData 函数开始---");
  //  var result = await sleep(Duration(seconds: 2));
  /// 假设 sleep 是个 耗时操作, await 会等待结果,等待获得结果后继续往下执行.
  /// 用同步的代码格式,写出异步代码.
  var res = await Future((){
    print("sleep 之前---");
    sleep(const Duration(seconds: 5));
    print("sleep 之后---");
    return "网络数据";
  });
  print("result---$res");
  print("getNetWorkData 函数返回-------->");
  // return res;

  /// 假设拿到了  await后面函数的 返回结果 ,然后返回
  //  return Future.value("result数据");
  /// 没有必要用Future包裹value. 直接返回数据.内部会自动包裹为Future.相当于语法糖.
  return "result数据";
}
