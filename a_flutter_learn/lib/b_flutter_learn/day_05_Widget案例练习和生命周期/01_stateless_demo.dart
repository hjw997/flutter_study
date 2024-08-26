import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/logger_config.dart';

void main() {runApp(const MyApp());}

//stl 快捷键
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("商品列表"),),
      body: const HYHomeContent(),
    );
  }
}
class HYHomeContent extends StatelessWidget {
  const HYHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildListView();
  }
  ///3.使用 ListView.
  Widget _buildListView() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView(children: const [
        HYHomeProductItem(
            title: "Apple1",
            desc: "Macbook Product1",
            imageUrl:
                "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        HYHomeProductItem(
            title: "Apple2",
            desc: "Macbook Product2",
            imageUrl:
                "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        HYHomeProductItem(
            title: "Apple3",
            desc: "Macbook Product3",
            imageUrl:
                "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg")
      ]),
    );
  }

  /// 2. 使用可滚动组件-ok
  Widget _buildScrollWidget() {
    return const SingleChildScrollView(
      child: Column(children: [
        HYHomeProductItem(title: "Apple1", desc: "Macbook Product1", imageUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        HYHomeProductItem(title: "Apple2", desc: "Macbook Product2", imageUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        HYHomeProductItem(title: "Apple3", desc: "Macbook Product3", imageUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg")
      ],),
    );
  }
  /// 1 常规 -超出范围报错. ❌经典黄色警告. ⚠️
  Widget _buildColumn() {
    /// 超出范围 经典黄色警告. ⚠️
    return const Column(children: [
      HYHomeProductItem(title: "Apple1", desc: "Macbook Product1", imageUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
      HYHomeProductItem(title: "Apple2", desc: "Macbook Product2", imageUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
      HYHomeProductItem(title: "Apple3", desc: "Macbook Product3", imageUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg")
    ],);
  }
}



class HYHomeProductItem extends StatelessWidget {
  /// stateless 中的定义的成员 一定是 final 的. ⭐️⭐️⭐️⭐️⭐️
  final String title;
  final String desc;
  final String imageUrl;
  /// 命名可选参数 使用 required 调用的时候可以不用顺序 ⭐️⭐️⭐️⭐️⭐️
  const HYHomeProductItem({super.key, required this.title, required this.desc, required this.imageUrl});

  /// ⭐️⭐️⭐️⭐️ 拥有常量构造方法的类中,所有的成员变量必须是 final 修饰的.
  final style1 =  const TextStyle(fontSize: 20,color: Colors.amber); /// 也可抽取出样式.

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border:Border.all(width: 5,color: Colors.black12)),
      child: Column(children: [
        Text(title,style: style1 ,),
        const SizedBox(height: 8,), ///SizedBox 尺寸盒子 可以做间距
        Text(desc,style: const TextStyle(fontSize: 18,color: Colors.green),),
        Image.network(imageUrl)
      ],),
    );
  }
}


