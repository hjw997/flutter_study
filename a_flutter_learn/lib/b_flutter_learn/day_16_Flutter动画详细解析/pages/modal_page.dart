import 'package:flutter/material.dart';

/// 模态弹出的界面:
class ModalPage extends StatelessWidget {
  const ModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
          title: const Text(
        "模态弹出页面",
        style: TextStyle(fontSize: 20, color: Colors.orangeAccent),
      )),
      body: Container(color: Colors.black12,),
    );
  }
}
