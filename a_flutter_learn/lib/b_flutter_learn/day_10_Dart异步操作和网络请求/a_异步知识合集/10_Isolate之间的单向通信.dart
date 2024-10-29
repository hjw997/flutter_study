

import 'dart:isolate';

void main() async{
  print("main---start");

  /// 如果我要拿到这个结果怎么处理呢?
  /// 1.我们需要一个接收的管道:
  ReceivePort receivePort = ReceivePort();

  /// 2.创建一个Isolate ,PS spawn 是个异步的Future. 这里用同步代码来等待.
  Isolate iso = await Isolate.spawn<SendPort>(calc, receivePort.sendPort);

  ///3. 监听管道:
  receivePort.listen((data){
    print("拿到结果:$data");

    /// 一般还有做的操作释放资源
    /// >1.关闭管道
    receivePort.close();
    /// >2.释放isolate
    iso.kill();
  });

  print("main----end");
}

/// 假设这个是个巨耗时的操作,如果在主线程就会卡住 主线程很长时间
/// 使用 管道通信后 这个返回就不像普通函数返回 而是通过 管道发送
// int calc(SendPort sendPort) {
void calc(SendPort sendPort) {
  var total = 0;
  for (var i = 0; i < 10000000; i++) {
    total += i;
  }

  sendPort.send(total);
}