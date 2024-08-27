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
  static const Widget verticalSpacer = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          /// Icon第一个必选参数说明:IconData.
          /// Icons.xxx 很多常量.
          /// 本质:上是IconData .
          /// static const IconData abc = IconData(0xf04b6, fontFamily: 'MaterialIcons');
          Icon(
            Icons.face,
            size: 100,

            /// 矢量图 放大不失真
            color: Colors.cyan,

            ///既然是字体 可以设置颜色
          ),

          /// Icon 是字体图标是一种矢量图(放大的时候不会失真).
          /// 优点:图标很多时,占据空间更小,因为Icons本质是字体,所以有些字体就是图标了
          ///----既然 这个字体内容是个图标 ? 那可否 使用 Text 来用呢?
          verticalSpacer,

          /// 1.0xf04b6 是个数字 要转为 unicode 编码. 如何转 加个 \u
          Text(
            //"0xf04b6",///只认4位???
            '\ue252',
            style: TextStyle(
                fontFamily: 'MaterialIcons', ///还要设置对应的字体
                color: Colors.orange,
                fontSize: 100),
          )
        ],
      ),
    );
  }
}
