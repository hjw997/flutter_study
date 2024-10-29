
import 'dart:io';

void main(){
  print("main---start");

  Future((){
    sleep(const Duration(seconds: 2));
    return "第一次结果";
  }).then((res1) {
    print("结果是:$res1");

    /// Future((){}).then((v){}); 第二次网络请求,如果这么写 就出现了地狱回调--不建议
    /// 直接可以做第二次网络请求:
    sleep(const Duration(seconds: 3));
    return "$res1 + 第二次结果";
  }).then((res2){ /// 然后直接再次链式调用.⭐️⭐️⭐️⭐️ 避免回调地狱
     print("第二次网络请求结果是:$res2");
  }).catchError((error) { /// 只要在这个链式过程中出现了异常,都会直接来这里.
     print("错误:$error");
  });

  print("main---end");
}


/// 总结:
/// 链式调用可以避免出现地狱回调.
/// 每个then中可以继续做耗时操作.
/// 只要是这个链上某个then 抛出异常,那么都会到最后的 catchError 的回调中.
/// 有待提升: 后面使用 async 和 await 后可以用同步的方式写出异步的代码.