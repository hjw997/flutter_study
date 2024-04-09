import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertDialog Demo")),
      body: Align(
        alignment: Alignment(0, 0.5),
        child: ElevatedButton(
          child: Text("弹出对话框"),
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (context) {
                double _value = 0.5; // 定义变量
                return AlertDialog(
                  title: Text("音量"),
                  content: IntrinsicHeight(
                    child: StatefulBuilder(
                      // 创建匿名Stateful组件
                      builder: (_, StateSetter setState) {
                        // 传入setState参数
                        return Slider(
                          value: _value,
                          onChanged: (v) {
                            setState(() => _value = v); // 调用setState更新状态
                          },
                        );
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text("OK"),
                      onPressed: () => Navigator.of(context).pop(_value),
                    )
                  ],
                );
              },
            );
            print(result);
          },
        ),
      ),
    );
  }
}
