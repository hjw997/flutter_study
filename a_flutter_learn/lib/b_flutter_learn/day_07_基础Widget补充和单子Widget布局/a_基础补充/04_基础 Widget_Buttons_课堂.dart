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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
    );
  }
}

/**
 * 新旧按钮样式变化:
 * https://docs.flutter.dev/release/breaking-changes/buttons
    Old Widget	     Old Theme	    New Widget	      New Theme
    FlatButton	     ButtonTheme 	  TextButton	      TextButtonTheme
    RaisedButton	   ButtonTheme 	  ElevatedButton	  ElevatedButtonTheme
    OutlineButton	   ButtonTheme    OutlinedButton	  OutlinedButtonTheme
 *
 */
class HYHomeContent extends StatelessWidget {
  static const Widget verticalSpacer = SizedBox(height: 10);
  static const Widget horizontalSpacer = SizedBox(width: 32);

  const HYHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("按钮样式"),
          verticalSpacer,

          /// onPressed 为 null 就是 Disable
          ElevatedButton(onPressed: null, child: Text("Disable")),
          verticalSpacer,
          ElevatedButton(onPressed: () {}, child: Text("Enable")),
          verticalSpacer,
          ElevatedButton(
            onPressed: () {},
            child: Text("Enable-1"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
          verticalSpacer,
          //FlatButton --> TextButton
          TextButton(
            onPressed: () => {},
            child: Text("TextButton #1"),
            style: TextButton.styleFrom(backgroundColor: Colors.orange),
          ),

          /// 这里没加间距 会看出有间距. style中有个  final MaterialTapTargetSize? tapTargetSize;
          TextButton(
            onPressed: () => {},
            child: Text("TextButton #2"),
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
          TextButton(
            onPressed: () => {},
            child: Text("TextButton #3"),
            style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
          TextButton( /// 就算没有内容 大小是 40 * 64
            onPressed: () => {},
            child: Text(""),
            style: TextButton.styleFrom(
                backgroundColor: Colors.orange,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          ),
          ButtonTheme(
            minWidth: 30,
            height: 10,
            child: TextButton( /// 就算没有内容 大小是 40 * 64
              ///  @override
              //   Widget build(BuildContext context) {
              //     final ButtonStyle? widgetStyle = widget.style;
              ///因为这里是通过 主题中的上下文中查找,我们可以在外面嵌套一个 ButtonTheme.
              //     final ButtonStyle? themeStyle = widget.themeStyleOf(context);
              //     final ButtonStyle defaultStyle = widget.defaultStyleOf(context);
              ///
              onPressed: () => {},
              //textTheme:ButtonTheme(minWidth: 30,height: 30,)
              child: Text("1"),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,padding: EdgeInsets.all(0)),
            ),
          ),
          verticalSpacer,
          /// Outlinebutton --边框按钮
          OutlinedButton(
            onPressed: () {},
            child: Text("OutlineButton"),
            //style: OutlinedButton.styleFrom(backgroundColor: Colors.blue),
          ),
          verticalSpacer,

          /// 自定义 Button
          TextButton(
            onPressed: () {},
            child: const Row(
              //PS: Row 默认占据整行. ⭐️⭐️⭐️⭐️⭐️
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.alarm), Text("自定义-按钮")],
            ),

            /// 圆角形状等. ShapBoder
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                backgroundColor: Colors.amber),
          ),
          verticalSpacer,
          TextButton(
            onPressed: () {},
            child: const Row(
              //PS: Row 默认占据整行. ⭐️⭐️⭐️⭐️⭐️
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.alarm), Text("自定义-按钮2")],
            ),

            /// 圆角形状等. ShapeBoder
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(10))),
                backgroundColor: Colors.greenAccent),
          ),
        ],
      ),
    );
  }
}
