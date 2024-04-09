import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(), // 根目录，即 "/" 路径
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => MyPage(title: 'Page A'),
      '/b': (BuildContext context) => MyPage(title: 'Page B'),
      '/page/c': (BuildContext context) => MyOtherPage(),
    },
    onGenerateRoute: (RouteSettings settings) {
      if (settings.name == "/user") {
        final args = settings.arguments as User;
        return MaterialPageRoute(builder: (_) => MyUserPage(user: args));
      }
      return null;
    },
    onUnknownRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (_) => Text("404"));
    },
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("命名打开 Page A"),
              onPressed: () => Navigator.of(context).pushNamed("/a"),
            ),
            ElevatedButton(
              child: Text("命名打开 Page B"),
              onPressed: () => Navigator.of(context).pushNamed("/b"),
            ),
            ElevatedButton(
              child: Text("命名打开 Page C"),
              onPressed: () => Navigator.of(context).pushNamed("/page/c"),
            ),
            ElevatedButton(
              child: Text("直接打开 Page C"),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => MyOtherPage()),
              ),
            ),
            ElevatedButton(
              child: Text("命名打开 Alice"),
              onPressed: () => Navigator.of(context)
                  .pushNamed("/user", arguments: User("Alice", 24)),
            ),
            ElevatedButton(
              child: Text("直接打开 Bob"),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MyUserPage(user: User("Bob", 26)),
                ),
              ),
            ),
            ElevatedButton(
              child: Text("打开错误路径"),
              onPressed: () => Navigator.of(context)
                  .pushNamed("/this/page/is/not/found", arguments: 123),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String title;

  MyPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}

class MyOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Text("Different Page C");
}

class MyUserPage extends StatelessWidget {
  final User user;

  const MyUserPage({required this.user});

  @override
  Widget build(BuildContext context) =>
      Text("User: name=${user.name}, age=${user.age}");
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);
}
