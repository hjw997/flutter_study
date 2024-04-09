import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("RichText Demo")),
        body: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 18),
            children: [
              TextSpan(text: "我已阅读"),
              TextSpan(
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
                text: "使用条款",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print("检测到用户点击使用条款"),
              ),
              TextSpan(text: "和"),
              TextSpan(
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
                text: "隐私政策",
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print("检测到用户点击隐私政策"),
              ),
              TextSpan(text: "。"),
            ],
          ),
        ),
      ),
    ),
  );
}
