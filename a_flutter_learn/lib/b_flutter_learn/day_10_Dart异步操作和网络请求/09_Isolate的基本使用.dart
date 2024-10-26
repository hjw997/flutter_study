

import 'dart:isolate';

/// 如果在dart 中想开启一个自己单独的线程:


void main(){
  print("main---start");
  /// 1.创建一个Isolate.
  /// 参数1 是耗时的任务的函数引用, 参数二 传递给函数的一些参数.
  Isolate.spawn(calc, 10000);

  print("main----end");
}

/// 假设这个是个巨耗时的操作,如果在主线程就会卡住 主线程很长时间
void calc(int  count) {
  var total = 0;
  for (var i = 0; i < count; i++) {
    total += i;
  }
  print(total);
}
