import 'package:flutter/material.dart';

void main() {
  final text =
      "Flutter is an open-source UI software development kit created by Google. "
      "It is used to develop applications for Android, iOS, Linux, Mac, Windows, "
      "Google Fuchsia and the web from a single codebase.";

  runApp(
    MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Text Demo")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(text), // 默认显示全部文本
              Text(
                text,
                overflow: TextOverflow.fade, // 渐淡
                maxLines: 2,
              ),
              Text(
                text,
                overflow: TextOverflow.ellipsis, // 省略号
                maxLines: 2,
              ),
              Text(
                text,
                overflow: TextOverflow.clip, // 裁剪
                maxLines: 2,
              ),
            ],
          ),
        )),
  );
}
