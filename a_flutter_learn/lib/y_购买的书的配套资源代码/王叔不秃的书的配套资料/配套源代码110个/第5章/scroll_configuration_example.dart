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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollConfiguration Demo"),
      ),
      body: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: ListView.separated(
          itemCount: 20,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (_, index) {
            return Container(
              height: 56,
              alignment: Alignment.center,
              child: Text("这是第${index + 1}项"),
            );
          },
        ),
      ),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(context, child, AxisDirection axisDirection) {
    return GlowingOverscrollIndicator(
      child: child,
      axisDirection: axisDirection,
      color: Colors.grey,
    );
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return ClampingScrollPhysics(parent: RangeMaintainingScrollPhysics());
  }
}
