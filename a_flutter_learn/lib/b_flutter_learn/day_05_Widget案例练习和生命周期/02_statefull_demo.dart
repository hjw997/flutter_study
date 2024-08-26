import 'package:a_flutter_learn/utils/logger_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: Scaffold(
          appBar: AppBar(title: const Text("StateFull")),
          body: HYHomeContentWidget(),
        ));
  }
}

///  Widget 不加_  ; 暴露给别人使用
///
class HYHomeContentWidget extends StatefulWidget {
  HYHomeContentWidget({super.key}) {
    logger.i("${LogTag.tag}----构造函数");
  }

  @override
  State<HYHomeContentWidget> createState() => _HYHomeContentWidgetState();
}

/// State  下划线_ 开头 表示库私有
class _HYHomeContentWidgetState extends State<HYHomeContentWidget> {
  /// var 和 具体类型一起用事冲突的. ⭐️⭐️⭐️⭐️⭐️
  /// var int count = 10;
  /// ⭐️⭐️⭐️⭐️⭐️
  /// 首先要知道一点:在 dart 中默认情况下,一个dart文件就是一个模块(库文件)
  int _count = 0; //库 私有 加下划线 _count

  final ButtonStyle style1 = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);

  final ButtonStyle style2 = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);

  /// 为什么 Flutter 在设计的时候 StatefulWidget 的 build 方法放在 State类中?
  /// 1.> build 出来的 Widget 是需要依赖 State 中的变量(状态/数据)
  /// 2.> Widget 是个描述信息, flutter 运行过程中 Widget 是不断的销毁和创建的.(build 方法会调用多次)
  ///     当我们自己的的状态发生改变,并不希望重新创建一个新的 State. 只是希望 build 中的 widget 更新.
  ///
  @override
  Widget build(BuildContext context) {
    logger.i("${LogTag.tag}----build 函数");

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 代码太长可以 抽取成方法.
         _getButtons(),
          Text("当前计数:$_count")
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: (){
            print("+ clicked");
            setState(() {
              _count += 1 ;
            });
          },
          style: style1,
          child: const Text(" + "),
        ),
        ElevatedButton(
          onPressed: () {
            print("- clicked");
            setState(() {
              if(_count>0){
                _count -= 1;
              }
            });
          },
          style: style2,
          child: const Text(" - "),
        )
      ],
    );
  }

}
