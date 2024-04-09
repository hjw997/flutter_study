import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification Demo")),
      body: NotificationListener(
        // 监听通知
        onNotification: (notification) {
          // 判断通知是否为自定义的 MyNotification 类型
          if (notification is MyNotification) {
            // 打印出自定义通知中的细节内容
            print(notification.details);
            return true; // 拦截，不再冒泡
          }
          return false; // 不拦截其他类型的通知
        },
        child: Sender(),
      ),
    );
  }
}

class Sender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: [
        ElevatedButton(
          child: Text("发送字符串通知"),
          onPressed: () => MyNotification("hello world").dispatch(context),
        ),
        ElevatedButton(
          child: Text("发送颜色通知"),
          onPressed: () => MyNotification(Colors.blue).dispatch(context),
        ),
      ],
    );
  }
}

class MyNotification extends Notification {
  // 自定义通知内部变量，用于存储通知细节信息，类型为dynamic，即支持任意类型
  final dynamic details;

  MyNotification(this.details);
}
