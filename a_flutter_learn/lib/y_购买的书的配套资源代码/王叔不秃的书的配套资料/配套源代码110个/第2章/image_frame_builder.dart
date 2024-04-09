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
        title: Text("利用frameBuilder实现图片淡入"),
      ),
      body: Image.network(
        "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        frameBuilder: (context, child, frame, _) {
          return AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: frame == null ? 0 : 1,
            child: child,
          );
        },
        gaplessPlayback: true,
      ),
    );
  }
}
