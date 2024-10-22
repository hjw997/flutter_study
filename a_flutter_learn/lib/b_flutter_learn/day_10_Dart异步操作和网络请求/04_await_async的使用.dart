import 'dart:io';

void main(List<String> args) {
  print("main 之前---");
  getNetWorkData().then((value) {
    print("then:$value" );
  });
  print("main 之后---");
}

/**
 * 解决问题:
 * 1.await必须在 async 函数中使用
 * 2.async 返回的结果必须是 Future.
 */
Future getNetWorkData() async {
  print("getNetWorkData 函数开始---");
  //  var result = await sleep(Duration(seconds: 2));
  /// 假设 sleep 是个 耗时操作, await 会等待结果,等待获得结果后继续往下执行.
  /// 用同步的代码格式,写出异步代码.
  await Future((){
    print("sleep 之前---");
    sleep(Duration(seconds: 2));
    print("sleep 之后---");
  });
  print("result---");

  /// 假设拿到了  await后面函数的 返回结果 ,然后返回
  //  return Future.value("result数据");
  /// 没有必要用Future包裹value. 直接返回数据.内部会自动包裹为Future.相当于语法糖.
  return "result数据";
}
