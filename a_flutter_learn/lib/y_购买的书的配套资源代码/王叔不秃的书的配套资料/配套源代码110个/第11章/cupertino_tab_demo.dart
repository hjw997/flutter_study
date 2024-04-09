import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: "Calls",
            icon: Icon(CupertinoIcons.phone_fill),
          ),
          BottomNavigationBarItem(
            label: "Messages",
            icon: Icon(CupertinoIcons.mail_solid),
          ),
          BottomNavigationBarItem(
            label: "Contacts",
            icon: Icon(CupertinoIcons.person_fill),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text("Cupertino Tab Demo"),
              ),
              backgroundColor: Color(0xffffffff),
              child: Center(child: Text("这是第${index + 1}页")),
            );
          },
        );
      },
    );
  }
}
