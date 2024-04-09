import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: Placeholder(fallbackHeight: 1000)),
              SliverLayoutBuilder(
                builder: (BuildContext context, SliverConstraints constraints) {
                  final double size = constraints.remainingPaintExtent
                      .clamp(0, constraints.crossAxisExtent);
                  print("$constraints");
                  return SliverToBoxAdapter(
                    child: Icon(Icons.circle, size: size),
                  );
                },
              ),
              SliverToBoxAdapter(child: Placeholder(fallbackHeight: 1000)),
            ],
          ),
        ),
      ),
    );
  }
}
