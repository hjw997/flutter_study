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
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    final box1 = Container(
      key: UniqueKey(),
      width: 50,
      height: 200,
      color: Colors.black,
    );
    final box2 = Container(
      width: 80,
      height: 50,
      color: Colors.grey,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Ani.Switcher vs Ani.CrossFade"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("AnimatedSwitcher", style: TextStyle(fontSize: 20)),
              AnimatedSwitcher(
                duration: Duration(seconds: 5),
                child: _showFirst ? box1 : box2,
              ),
              Flexible(
                child: ElevatedButton(
                  child: Text("Swap"),
                  onPressed: () => setState(() => _showFirst = !_showFirst),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("AnimatedCrossFade", style: TextStyle(fontSize: 20)),
              AnimatedCrossFade(
                duration: Duration(seconds: 5),
                firstChild: box1,
                secondChild: box2,
                crossFadeState: _showFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
              Flexible(
                child: ElevatedButton(
                  child: Text("Swap"),
                  onPressed: () => setState(() => _showFirst = !_showFirst),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
