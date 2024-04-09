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
        title: Text("RichText可在不同样式之间切换"),
      ),
      body: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          text: "晋太元中，",
          children: [
            TextSpan(
              text: "武陵",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: "人捕鱼为业。",
            ),
            TextSpan(
              style: TextStyle(fontStyle: FontStyle.italic),
              text: "缘溪行，忘路之远近。",
              children: [
                TextSpan(text: "忽逢桃花林，"),
                TextSpan(
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                  ),
                  text: "夹岸",
                ),
                TextSpan(text: "数百步，中无杂树，芳草鲜美，"),
                TextSpan(
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.wavy,
                  ),
                  text: "落英缤纷",
                ),
                TextSpan(text: "。"),
              ],
            ),
            TextSpan(
              text: "渔人甚异之。复前行，欲穷其林。",
            ),
          ],
        ),
      ),
    );
  }
}
