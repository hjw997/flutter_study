import 'package:flutter/material.dart';

void main() {
  runApp(const Center(
    child: Text(
      "hello",
      textDirection: TextDirection.ltr, /// 没有方向会报错. 主题中会有设置方向
      style: TextStyle(color: Colors.orange, fontSize: 30),
    ),
  ));
}
