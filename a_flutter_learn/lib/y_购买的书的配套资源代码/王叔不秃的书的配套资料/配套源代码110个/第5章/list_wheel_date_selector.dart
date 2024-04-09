import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListWheelScrollView Demo"),
        ),
        body: ListWheelScrollView(
          perspective: 0.005,
          // 定义"视角"
          itemExtent: 48,
          // 固定元素高度
          magnification: 1.2,
          // 中心元素放大1.2倍
          overAndUnderCenterOpacity: 0.5,
          // 非中心元素半透明
          physics: FixedExtentScrollPhysics(),
          // 固定范围的滚动物理
          onSelectedItemChanged: (index) {
            // 选择值改变时的回传
            print("选择了${index + 1}日");
          },
          children: List.generate(
            // 生成子组件列表
            31, // 共有31个元素
                (index) =>
                Container(
                  color: Colors.grey, // 灰色
                  alignment: Alignment.center, // 居中
                  child: Text("${index + 1}日"), // 显示日期，如28日
                ),
          ),
        ),
      ),
    );
  }
}
