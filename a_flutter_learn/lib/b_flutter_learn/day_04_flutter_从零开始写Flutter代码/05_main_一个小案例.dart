import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../utils/logger_config.dart';

/// 一行代码 箭头函数:
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.amber,
      ),
      body: const HomeContentBody(),
    );
  }
}

class HomeContentBody extends StatefulWidget {
  /// 如果 Widge 中定义 变量要 final
  /// Flutter通过一些机制来限定定义到Widget中的成员变量必须是final的
  /// 定义到Widget中的数据一定是不可变的，需要使用final来修饰 ⭐️⭐️⭐️⭐️⭐️
  const HomeContentBody({super.key});

  @override
  State<HomeContentBody> createState() => _HomeContentBodyState();
}

/**
 * 状态类
 * 用来 管理 状态
 */
class _HomeContentBodyState extends State<HomeContentBody> {

  bool?  isChecked = false;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(Icons.check_box),
          /**
           *  在命名可选参数中使用 required  可以不用按照顺序传. ⭐️⭐️⭐️⭐️⭐️
           *  required this.value,
           */
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              logger.i("TAG= ${LogTag.tag}----$value");
              setState(() {
                isChecked = value;
              });
            }),
          const Text(
            "选择",
            style: TextStyle(color: Colors.orange, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
