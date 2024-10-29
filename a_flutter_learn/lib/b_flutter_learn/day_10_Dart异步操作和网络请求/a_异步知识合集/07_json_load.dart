
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Anchor {
  String nickName;
  String roomName;
  String imageUrl;

  /// 未命名构造函数
  Anchor({required this.imageUrl,required this.nickName,required this.roomName});

  /// 命名构造 和 初始化列表
  Anchor.withMap(Map<String, dynamic> map)
      : nickName = map["nickName"],
        roomName = map["roomName"],
        imageUrl = map["imageUrl"];

/**
 * 这里在复习一下 构造器 :
 * https://dart.dev/language/constructors#default-constructors

 * Constructors are special functions that create instances of classes.

    Dart implements many types of constructors. Except for default constructors, these functions use the same name as their class.

    1.Generative constructors: Creates new instances and initializes instance variables.
    2.Default constructors: Used to create a new instance when a constructor hasn't been specified. It doesn't take arguments and isn't named.
    3.Named constructors: Clarifies the purpose of a constructor or allows the creation of multiple constructors for the same class.
    4.Constant constructors: Creates instances as compile-type constants.
    5.Factory constructors: Either creates a new instance of a subtype or returns an existing instance from cache.
    6.Redirecting constructor: Forwards calls to another constructor in the same class.
 */

}

/// 一个异步加载JSON的案例:
Future<List<Anchor>> getAnchors() async {

  /// 1.从资源文件夹 加载json文件:  rootBundle 老版本中要给 show 出来. 最新的不用了.
  String jsonStr = await rootBundle.loadString("assets/yz.json"); //loadString 是个异步任务等待结果返回
  /// PS :assets/yz.json 这个是个节选 实际上没有这个JSON文件.这里主要是 对 异步的使用.
  /** ❌报错问题:
   * :Binding has not yet been initialized.
   * Typically, this is done by calling "WidgetsFlutterBinding.ensureInitialized()" or "runApp()"
   */

  /// 2.转成List 或 Map类型
  final jsonResult = json.decode(jsonStr);

  ///3.遍历List 并且转为Anchor对象放到另一个List中
  var  anchors = <Anchor>[]; /// 创建一个空 List

  for (Map<String,dynamic> map in jsonResult) {
    anchors.add(Anchor.withMap(map));
  }
  return anchors;
}

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
  @override
  void initState() {
    super.initState();

    /// 核心调用: ⭐️⭐️⭐️⭐️
    getAnchors().then((anchors){
      print("JSON加载成功:$anchors");
    }).catchError((error){
      print("JSON加载错误:$error");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}

/**
 * JSON加载的几个问题记载:
 * 1. 第一个 rootBundle 在service 库中,不用再 如老师教案上的 show 这个library.
 * 2. 这个rootBundle 一定要在 Flutter 框架中的 Typically, this is done by calling "WidgetsFlutterBinding.ensureInitialized()" or "runApp()" 这个之后 初始化后.
 *
 */