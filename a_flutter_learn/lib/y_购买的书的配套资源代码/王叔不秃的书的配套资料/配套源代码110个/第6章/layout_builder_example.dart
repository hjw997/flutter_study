import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
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
        title: Text("LayoutBuilder Demo"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 500) {
            return ListView.builder(
              itemBuilder: (_, index) => Container(
                height: 100,
                color: Colors.grey[index % 9 * 100],
              ),
            );
          }
          return Row(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) => Container(
                    height: 100,
                    color: Colors.grey[index % 9 * 100],
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (_, index) => Container(
                    height: 100,
                    color: Colors.grey[index % 9 * 100],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
