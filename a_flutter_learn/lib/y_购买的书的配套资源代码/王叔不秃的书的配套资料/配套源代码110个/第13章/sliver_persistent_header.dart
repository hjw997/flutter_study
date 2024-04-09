import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true, // 钉住导航条
              title: Text("Flutter Demo"),
            ),
            SliverToBoxAdapter(),
            for (int i = 1; i < 5; i++) ..._buildSection(i),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSection(int index) {
    return [
      SliverPersistentHeader(
        pinned: true, // 钉住标题栏
        delegate: _MyDelegate(
          height: 48.0,
          child: FittedBox(child: Text("Sliver Header $index")),
        ),
      ),
      SliverFixedExtentList(
        itemExtent: 50,
        delegate: SliverChildBuilderDelegate((_, i) {
          return Container(color: Colors.primaries[i * 2][200]);
        }, childCount: 8),
      ),
    ];
  }
}

class _MyDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget? child;

  _MyDelegate({required this.height, this.child});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: Material(
        // 若标题栏下面有内容（被钉住），则渲染投影
        elevation: overlapsContent ? 4.0 : 0.0,
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(_) => true;
}
