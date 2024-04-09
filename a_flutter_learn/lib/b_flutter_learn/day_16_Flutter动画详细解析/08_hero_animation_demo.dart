import './pages/hero_detail_page.dart';
import 'package:flutter/material.dart';

/// 这个项目是 flutter create xxx 生成的项目模板. 计数器模板代码.
/// PS:✅ 当函数体只有一行的时候可以使用箭头函数-使得代码更加简洁.
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
      home: const MyHomePage(title: 'Hero 动画案例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  /// Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 2,
        ),
        children: List.generate(80, (index) {
          /// PS : dart中箭头函数,函数体只能有一行.否则报错.
          String imageURL = "https://picsum.photos/id/$index/400/200";
          return GestureDetector(
            onTap: () => _go2ImageDetailPage(context,imageURL),
            child: Hero(tag: imageURL,
                child: Image.network(imageURL)),
          );
        }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _go2ImageDetailPage(BuildContext context, String imgUrl) {
    Navigator.of(context).push(
        PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
          return HeroDetailPage(imageURL: imgUrl);
        }));
  }
}
