import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHome()));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CupertinoActionSheet Demo")),
      body: Center(
        child: ElevatedButton(
          child: Text("弹出Cupertino选项卡"),
          onPressed: () async {
            final result = await showCupertinoModalPopup(
              context: context,
              builder: (_) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    child: Text("正常模式"),
                    onPressed: () => Navigator.of(context).pop("light"),
                  ),
                  CupertinoActionSheetAction(
                    child: Text("夜间模式"),
                    onPressed: () => Navigator.of(context).pop("dark"),
                  ),
                ],
              ),
            );
            print(result);
          },
        ),
      ),
    );
  }
}
