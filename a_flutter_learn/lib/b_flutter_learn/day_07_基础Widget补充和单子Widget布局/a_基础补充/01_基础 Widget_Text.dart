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

  @override
  Widget build(BuildContext context) {
    return const Center(
      ///class Text extends StatelessWidget  --> build 是真实的东西
      child: Text(
        "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
        textAlign: TextAlign.center, //textAlign/控制文本布局
        ///style 控制文本样式:
        style: TextStyle(
            backgroundColor: Colors.brown,
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.w400),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        // textScaleFactor: 1.5,
        textScaler: TextScaler.linear(3.5),
      ),
    );
  }
}
