import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHome()));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableScrollableSheet"),
      ),
      body: DraggableScrollableSheet(
        builder: (context, ScrollController controller) {
          return Container(
            color: Colors.grey,
            child: ListView.builder(
              controller: controller, // 传入滚动控制器
              itemBuilder: (_, index) => Center(child: Text("$index")),
            ),
          );
        },
      ),
    );
  }
}
