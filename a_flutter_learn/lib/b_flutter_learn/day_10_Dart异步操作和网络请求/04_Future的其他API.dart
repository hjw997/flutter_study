void main(){
  /// 如果我们想直接返回一个Future , 怎么搞?
  Future((){
    /// 1.方式这里直接返回结果-没有耗时
    return "hello-1";
  }).then((onValue){
    print("结果是:$onValue");
  });

  /// 2.简化写法: Future.value
  Future.value("hello-2").then((onValue) {
    print("结果是:$onValue");
  });

  ///3 如果是个错误的
  Future.error("error-msg").catchError((onError){
    print("结果是:$onError");
  });

  ///4.某些Future 延迟一会执行.
  Future.delayed(const Duration(seconds: 3),(){
     /// 想要延迟执行的代码:
      return "Delayed --Result";
  }).then((onValue){
    print("结果是:$onValue");
  });
}