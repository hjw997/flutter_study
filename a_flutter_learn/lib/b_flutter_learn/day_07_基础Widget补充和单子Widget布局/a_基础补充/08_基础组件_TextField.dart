import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("基础组件-TextFiled"),
      ),
      body: const HYHomeContent(),
    );
  }
}

/// stful 快捷键 生成:StatefulWidget
class HYHomeContent extends StatefulWidget {
  const HYHomeContent({super.key});

  @override
  HYHomeContentState createState() => HYHomeContentState();
}

class HYHomeContentState extends State<HYHomeContent> {
  static const Widget verticalSpacer = SizedBox(height: 10);

  final userNameController = TextEditingController();

  final passwordController = TextEditingController();


  /**
   * Colors的几种创建方式: ⭐️⭐️⭐️⭐️
   *
   */

  Color c1 = Color(0xffffff); ///使用十六进制 前两位 是透明度 ,后面的依次是 r g b

  Color c2 = Color.fromARGB(1, 255, 244, 235);  /// 透明度 a 也是 0-255.

  Color c3 = const Color.fromRGBO(233, 233, 233, 0.5);/// opacity 不透明度, 0 是透明 1 是完全不透明

  /// Colors.red[50] [50] 表示???? ⭐️⭐️⭐️⭐️
  /// Returns an element of the swatch table. Colors中 对 [] 做了操作符重载.
  ///   Color? operator [](T index) => _swatch[index];
  Color c4 = Colors.black;

  Color? c5 = Colors.red[50];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        ///给一些装饰
        decoration: InputDecoration(
          labelText: "姓名",
          icon: Icon(Icons.people),
          hintText: "请输入内容",
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          filled: true,

          /// Colors.red[50] [50] 表示???? ⭐️⭐️⭐️⭐️
          /// Returns an element of the swatch table. Colors中 对 [] 做了操作符重载.
          ///   Color? operator [](T index) => _swatch[index];
          /// fillColor: Colors.red[50],
          fillColor: Colors.greenAccent,
        ),
        onChanged: (value) {
          print("onChanged-监听输入: $value");
        },
        onSubmitted: (value) {
          print("onSubmitted-监听输入完成: $value");
        },
        controller: userNameController,
      ),
      verticalSpacer,
      TextField(
        maxLines: 1,
        controller: passwordController,
        decoration: const InputDecoration(
            labelText: "密码",
            icon: Icon(Icons.lock),
            border: OutlineInputBorder()),
      ),
      verticalSpacer,

      /// 点击登录的时候 获取到 输入的姓名 密码.
      Container(
        //width: 300,
        width: double.infinity,

        /// 沾满父容器宽度
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            final name = userNameController.text;
            final pwd = passwordController.text;
            print("name = $name , pwd = $pwd");
            userNameController.text = "";
            passwordController.text = "";
          },
          child: Text("登录"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
      )
    ]);
  }
}
