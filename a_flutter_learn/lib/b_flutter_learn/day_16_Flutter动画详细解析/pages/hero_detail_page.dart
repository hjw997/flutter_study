import 'package:flutter/material.dart';

/// Hero 动画展示跳进来:
class HeroDetailPage extends StatelessWidget {
  const HeroDetailPage({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: GestureDetector(
          /// 设置这个属性点击空白区域也会响应.
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            child: Hero(
              tag: imageURL,
              child: Image.network(
                imageURL,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
