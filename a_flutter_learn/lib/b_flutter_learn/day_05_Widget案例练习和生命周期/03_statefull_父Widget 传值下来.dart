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
          appBar: AppBar(title: const Text("StatefulWidget")),
          body: HYHomeContentWidget(message:"你好,李银河"),
        ));
  }
}

///  Widget 不加_  ; 暴露给别人使用
///
class HYHomeContentWidget extends StatefulWidget {
  /// 如果 Widge 中定义 变量要 final
  final String message;

  /// required 必传的 命名可选参数 好处,不用顺序.
  HYHomeContentWidget({super.key, required this.message}) {
    logger.i("${LogTag.tag}----构造函数");
  }

  @override
  State<HYHomeContentWidget> createState() => _HYHomeContentWidgetState();
  /// 在这里 创建 State 的时候可以传值给 State,但是会有⚠️.也不建议.
}

/// State  下划线_ 开头 表示库私有
class _HYHomeContentWidgetState extends State<HYHomeContentWidget> {

  /** ⭐️⭐️⭐️⭐️⭐️
   * PS : 因为 每个 State 都会有一个对 对应的 StatefulWidget 的引用.
   * widget 的属性
   */

  int _count = 0;
  final ButtonStyle style1 = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);

  final ButtonStyle style2 = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), backgroundColor: Colors.green);

  @override
  Widget build(BuildContext context) {
    logger.i("${LogTag.tag}----build 函数");

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         _getButtons(),
          Text("当前计数:$_count"),
          ///从 state 中访问对应的 statefulWidget 的属性. ⭐️⭐️⭐️⭐️⭐️
          Text("父组件传值下来是:${this.widget.message}")
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
            if (kDebugMode) {
              print("+ clicked");
            }
            setState(() {
              _count += 1 ;
            });
          },
          style: style1,
          child: const Text(" + "),
        ),
        ElevatedButton(
          onPressed: () {
            if (kDebugMode) {
              print("- clicked");
            }
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
