import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("显示图片加载进度百分比"),
      ),
      body: Image.network(
        "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        loadingBuilder: (context, child, progress) {
          // 如果已经加载完成，就直接显示图片
          if (progress == null) return child;
          // 计算加载完成度百分比：已下载字节/预计总字节*100
          final percent = progress.cumulativeBytesLoaded /
              progress.expectedTotalBytes! *
              100;
          return Text("加载$percent%");
        },
      ),
    );
  }
}
