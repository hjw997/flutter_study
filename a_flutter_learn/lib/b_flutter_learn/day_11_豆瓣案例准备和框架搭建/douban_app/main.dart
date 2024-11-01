
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: HYStarRating(totalRating: 10,rating: 5.0,),
    );
  }
}


class HYStarRating extends StatefulWidget {
  /// 满分-总分:
  final double totalRating;
  /// 用户打分几分:
  final double rating;
  /// 星星个数
  final int starCount;
  /// 星星的大小:
  final double  starSize;

  /// 未选中颜色
  final Color unSelectedColor;
  /// 选中颜色
  final Color selectedColor;

  Widget unselectedWidget;
  Widget selectedWidget;

  HYStarRating({super.key,
    this.totalRating = 10,
    required this.rating,
    this.starCount = 5,
    this.starSize = 30,
    /// 这种值就要 const , 初始化列表就可以写表达式.
    this.unSelectedColor = const Color(0xffff0000),
    this.selectedColor = const Color(0xffffff00),
    Widget? unselectedWidget,
    Widget? selectedWidget,
  }): unselectedWidget = unselectedWidget ??  Icon(Icons.star_border,color: unSelectedColor,size: starSize),
      selectedWidget = selectedWidget ?? Icon(Icons.star,color: selectedColor,size: starSize);

  @override
  State<HYStarRating> createState() => _HYStarRatingState();
}

class _HYStarRatingState extends State<HYStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildUnSelectedWidget(),
        ),
        Row(children: _buildSelectedWidget())
      ],
    );
  }

  List<Widget> _buildUnSelectedWidget(){
   return List.generate(widget.starCount, (index) {
      return widget.unselectedWidget;
    });
  }

  List<Widget> _buildSelectedWidget() {
    /// 关键思路分析: 总共几个完整的 , 然后剩下的 小数部分 通过裁剪widget.
    ///  一个星星表示几分?  总分 / 数量
    /// ???????????????????????????????????????????????????????????????????????????????



    return [
      Icon(Icons.star,color: Colors.red,size: widget.starSize,),
      Icon(Icons.star,color: Colors.red,size: widget.starSize,),
      Icon(Icons.star,color: Colors.red,size: widget.starSize,),
    ];
  }
}
