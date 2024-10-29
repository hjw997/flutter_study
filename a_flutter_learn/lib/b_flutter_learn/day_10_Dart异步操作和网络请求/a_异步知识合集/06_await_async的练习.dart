import 'dart:io';

void main() {
  print("main---start");

  /// getData0();

  /// 想要这里拿到请求:
  // getData1().then((mres){
  //   print("main-- res =$mres");
  // });

  getData2().then((mainRes){
    /// 业务代码 ---一般用then
    print("main-- res =$mainRes");
  }).catchError((onError){
    /// await 异常处理也是这里处理

  });


  print("main----end");

}

/**
 * 需求: 假如有三次网络请求, 每次返回 请求的参数拼接 , 三次网络请求后拿到结果
 */

/// 00 版本1 : 最终在调用的地方不用返回结果:---Future的链式调用.
void getData0() {
  getNetworkData("args1").then((res1){
    print("拿到第一次结果: res1 = $res1");
    /// 如果这样继续写就成了地域回调
    /// getNetworkData(res).then(onValue)

    /// 直接返回 一个 getNetworkData 返回的Future,到后面的链式调用中
    return getNetworkData(res1);
  }).then((res2){
    print("拿到第二次结果: res2 = $res2");
    /// 使用爹二次拿到的结果请求
    return getNetworkData(res2);
  }).then((res3){
    print("拿到第三次结果: res2 = $res3");
    return getNetworkData(res3);
  }).then((res){
     print("拿到最终结果: res = $res");
  });
}

/// 01 使用Future 的链式调用方式: 返回一个 Future 可以在调用的地方 在来一个 then 拿到最终结果:
Future<String> getData1() {
  return  getNetworkData("args1").then((res1){
      print("拿到第一次结果: res1 = $res1");
      /// 如果这样继续写就成了地域回调
      /// getNetworkData(res).then(onValue)

      /// 直接返回 一个 getNetworkData,到后面的链式调用中
       return getNetworkData(res1);
    }).then((res2){
       print("拿到第二次结果: res2 = $res2");
       /// 使用爹二次拿到的结果请求
       return getNetworkData(res2);
    }).then((res3){
       print("拿到第三次结果: res2 = $res3");
       return getNetworkData(res3);
    }).then((res){
        print("拿到最终结果: res = $res");
        return res; ///这里返回最终结果: ⭐️⭐️⭐️⭐️
    });
}


/// 2.使用 async  await  用同步 代码写异步回调的替代方案: 重点学会这个方式 ⭐️⭐️⭐️⭐️
/// 代码简洁: 👍🏻 :
Future<String> getData2() async {
  print("getData2 ----开始");

  var res1 = await getNetworkData("args1");
  print("拿到结果1 = $res1");

  var res2 = await getNetworkData(res1);
  print("拿到结果2 = $res2");

  var res3 = await getNetworkData(res2);
  print("拿到结果3 = $res3");
  return res3;

  /// PS  如果 await 这种地方出现异常,那么这里会直接 抛出异常 ,到调用的 catchError 中处理.
}


Future<String> getNetworkData(String args) {
  return Future(() {
    sleep(const Duration(seconds: 2));
    return "Hello-$args";
  });
}