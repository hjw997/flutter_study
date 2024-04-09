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
        title: Text("Dismissible Demo"),
      ),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (_, index) {
          return Dismissible(
            key: UniqueKey(),
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("确认"),
                    content: Text("确认要删除这一项吗？"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("取消"),
                      ),
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text(
                            "删除",
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  );
                },
              );
            },
            background: Container(
              padding: EdgeInsets.all(16),
              color: Colors.black,
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
            ),
            child: Container(
              height: 56,
              alignment: Alignment.center,
              child: Text("这是第${index + 1}项"),
            ),
          );
        },
      ),
    );
  }
}
