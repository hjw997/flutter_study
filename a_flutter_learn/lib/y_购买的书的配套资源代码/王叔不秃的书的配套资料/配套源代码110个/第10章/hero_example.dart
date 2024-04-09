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
      appBar: AppBar(title: Text("Home Page")),
      body: GridView.count(
        crossAxisCount: 3,
        // 本例使用了OpenMoji的开源图标库，
        // 若未来这些图片的URL失效，读者可替换成任意其他图片的URL，
        // 或直接使用Image.asset等方式加载本地图片继续浏览本例
        children: ["1F681", "1FAB5", "1F6A6", "1F68A", "2603"].map((data) {
          final url = "https://openmoji.org/php/download_from_github.php"
              "?emoji_hexcode=$data&emoji_variant=color";
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MyDetailsPage(url),
              ),
            ),
            child: Hero(
              tag: url,
              child: Image.network(url, fit: BoxFit.cover),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MyDetailsPage extends StatelessWidget {
  final String url;

  const MyDetailsPage(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情介绍页面")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: url,
              child: Image.network(url, fit: BoxFit.cover),
            ),
            Text(
              "lorem ipsum dolor sit amet " * 4,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
