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
    return Center(
      /// 图文混排:
      child: Text.rich(TextSpan(
          text: "Hello_Text_Span",
          // List<InlineSpan>? children : InlineSpan实现类有   TextSpan WidgetSpan
          children: [
            TextSpan(text: "Span1",style: TextStyle(fontSize: 20,color: Colors.red)),
            TextSpan(text: "Span2",style: TextStyle(fontSize: 20,color: Colors.blue)),
            WidgetSpan(child: Icon(Icons.favorite,color: Colors.red,)),
            TextSpan(text: "Span3",style: TextStyle(fontSize: 20,color: Colors.orange)),
            TextSpan(text: "同意协议",style: TextStyle(fontSize: 20,color: Colors.green,decoration: TextDecoration.underline)),
          ]
      )),
    );
  }
}
