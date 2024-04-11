/// 主题作用: 比如有些组件创建后就会根据主题的颜色显示.--看笔记
///

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialColor materialColor = Colors.red;

    ///  Colors.red 其实就是: 传上去一个 _redPrimaryValue 给父类的构造
    ///  Color c = Color(0xFFF44336); 最上层的类中是这样构造的.

    /// Colors.red[100] 这个的语法细节:
    /*** 内部对 [] 做了运算符重载. 其实就是调用一个对象方法;
     * /// Returns an element of the swatch table.
        Color? operator [](T index) => _swatch[index];
     */

    /// 黑色 和 白色是 直接使用 Color(构造的)
    Color white = Colors.white;
    Color black = Colors.black;

    return MaterialApp(
      title: 'Flutter Demo',

      /// 1.全局主题:
      theme: ThemeData(

          /// 1.亮度: 白天还是黑夜模式. 根据系统 是否是 暗黑模式.
          //brightness: Brightness.dark,

          /// 2.主样品: 有些组件就会跟随这个颜色.
          /// 如:  AppBar FloatingButton , BottomNavigationBar的 item ,Switch. 等等.
          /// MaterialColor 继承自 Color
          primarySwatch: Colors.blue,

          /// 如果不设置 跟随 primarySwatch 的颜色.
          /// 主要决定 导航 和 TabBar 的颜色. 貌似不起作用:
          /// 使用  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          primaryColor: Colors.amber,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.amberAccent),

          /// button 的主题.默认的大小
          buttonTheme: const ButtonThemeData(),
          cardTheme: const CardTheme(
            color: Colors.orange,
            shadowColor: Colors.cyanAccent,
            elevation: 8, // 阴影.
            clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          textTheme: const TextTheme(
              titleLarge: TextStyle(fontSize: 20, color: Colors.blueAccent))),
      home: const HomePage(title: 'Flutter 主题样式'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Switch(value: true, onChanged: (onChanged) {}),

            /// ios 样式
            CupertinoSwitch(value: true, onChanged: (v) {}),

            /// 为何这个按钮 有最小宽高? buttonTheme 看着组件的 build 方法是怎么构建的. 里面就有获取 Theme 的方法.
            /// https://api.flutter.dev/flutter/material/ButtonThemeData-class.html 官方说已过期.
            /// 57 分钟.
            ElevatedButton(onPressed: () {}, child: const Text("C")),

            const Card(
              child: Text(
                "你好吗?",
                style: TextStyle(fontSize: 20),
              ),
            ),

            ///
            Text(
              "我是文本",
              style: Theme.of(context).textTheme.displayMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return const HYDetailPage();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HYDetailPage extends StatelessWidget {
  const HYDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 2.局部主题
    return Theme(
      // data: ThemeData(
      //   appBarTheme: const AppBarTheme(color: Colors.blueAccent),
      //   textTheme: const TextTheme(displayMedium: TextStyle(color: Colors.red))
      // ),
      /// 再全局的基础上 拷贝 后修改.---常用的修改方式.这里的主题 要和19 年课程有很大的变化, 主题名字更加规范.
      data: Theme.of(context).copyWith(
          appBarTheme: const AppBarTheme(color: Colors.cyan),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.blueAccent)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("详情页面"),
        ),
        body: const Center(
          child: Text("详情页面"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.pets),
        ),
      ),
    );
  }
}
