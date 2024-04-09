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
        title: Text("AlertDialog Demo"),
      ),
      body: ElevatedButton(
        child: Text("弹出对话框"),
        onPressed: () async {
          // 用async关键字标注异步方法
          final result = await showDialog(
            // 用await关键字等待异步结果
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("删除文件"),
                content: Text("确定要删除 DCIM_0001.jpg 文件吗？"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // 关闭，无返回值
                    },
                    child: Text("取消"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); // 关闭，返回true值
                    },
                    child: Text(
                      "删除",
                      style: TextStyle(color: Colors.red), // 删除按钮使用红色
                    ),
                  )
                ],
              );
            },
          );
          print(result); // 打印返回值
        },
      ),
    );
  }
}
