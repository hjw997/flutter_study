import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Homepage();
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: const HYHomeContent(),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
    );
  }
}

class HYHomeContent extends StatelessWidget {
  const HYHomeContent({super.key});

  static const Widget verticalSpacer = SizedBox(height: 10);
  final String URL1 =
      'https://flutter.github.io/assets-for-api-docs/assets/material/text_button_grass.jpeg';
  final String URL2 =
      'https://flutter.github.io/assets-for-api-docs/assets/material/text_button_nhu_end.png';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
          color: Colors.amber,
          child: Image(
            image: NetworkImage(URL1),
            width: 200,
            height: 200,
            //fit: BoxFit.fitWidth, /// 宽度一定, 高度自适应
            //fit: BoxFit.fitHeight, /// 高度一定, 宽度自适应
            /// 对齐方式: Alignment 范围 -1,1
            /// 关于Alignment 参考: https://biglead.blog.csdn.net/article/details/94167281
            alignment: Alignment.bottomCenter,

            ///定义好的常量.
            //repeat: ImageRepeat.repeatY, 重复
          ),
        )),
        verticalSpacer,

        ///加载网络图片 ⭐️⭐️⭐️⭐️
        Center(
            child: Container(
          color: Colors.blue,
          child: Image.network(URL2),
        )),
        verticalSpacer,

        /// 加载本地图片
        Center(
          child: Image(
            /// AssetImage 也是一个 ImageProvider 加载本地图片.
            /// 加载本地图片步骤:
            /// 1>.在flutter 项目中创建一个文件夹,存储图片.
            /// 2>.在pubspec.yaml进行配置.
            image: AssetImage(""),
          ),
        )
      ],
    );
  }
}
