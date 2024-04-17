import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/logger_config.dart';

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
        title: const Text("基础组件"),
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
  var isfavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      fit: StackFit.loose,
      children: [
        const Image(
          image: AssetImage("assets/images/juren.jpeg"),
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: const Color.fromARGB(100, 0, 0, 0),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "进击的巨人真好看",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(onPressed: () {
                  logger.i("${LogTag.tag}----IconButton--点击");
                  setState(() {
                    isfavorite = !isfavorite;
                  });
                }, icon: Icon(Icons.favorite,color: isfavorite ? Colors.red :  Colors.white,))
              ],
            ),
          ),
        )
      ],
    );
  }
}
