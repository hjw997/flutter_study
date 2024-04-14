import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("基础组件"),
      ),
      body: const HYHomeContent(),
    );
  }
}

/// stful 快捷键 生成:StatefulWidget
class HYHomeContent extends StatefulWidget {
  const HYHomeContent({super.key});

  @override
  HYHomeContentState createState() => HYHomeContentState();
}

class HYHomeContentState extends State<HYHomeContent> {
  @override
  Widget build(BuildContext context) {
    ///Column 基本使用: 主轴(竖向)占到最大,横向包裹内容.
    return Column(
      /// 主轴方法 是默认 start 挨个摆放.
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      /// 下面的两个 是改变 主轴方向的.
      /// 垂直是 从上到下,还是从下到上. 这个对 Column 有效--改变 Column 的主轴方向.
      verticalDirection: VerticalDirection.down,
      /// rtl 水平方向上 文字方向 ,只对 Row 有效. ---改变 Row 的主轴方向.
      textDirection: TextDirection.rtl,
      children: [
        Container(
          color: Colors.orange,
          width: 30,
          child: Text("123",style: TextStyle(fontSize: 20),),
        ),
        Container(
          color: Colors.blueAccent,
          width:50,
          child: Text("456",style: TextStyle(fontSize: 20),),
        ),
        Container(
          color: Colors.red,
          width: 20,
          child: Text("abc",style: TextStyle(fontSize: 20),),
        ),
        Container(
          color: Colors.purpleAccent,
          width: 40,
          child: Text("789",style: TextStyle(fontSize: 20),),
        ),
      ],
    );
  }
}

/// 枚举语法补充:
enum Color {
  Red,
  Blue
}
/// 枚举有个 values 属性 是里面所有的枚举值.
List<Color> colors = Color.values;

