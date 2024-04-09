import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Auto Scroll Physics"),
        ),
        body: ListView.builder(
          physics: AutoScrollPhysics(),
          itemBuilder: (_, index) => Text("$index"),
        ),
      ),
    );
  }
}

class AutoScrollPhysics extends ScrollPhysics {
  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) => AutoScrollPhysics();

  @override
  bool shouldAcceptUserOffset(ScrollMetrics position) => false;

  @override
  Simulation createBallisticSimulation(position, velocity) =>
      AutoScrollSimulation();
}

class AutoScrollSimulation extends Simulation {
  static const velocity = 200.0;

  @override
  double x(double time) => velocity * time;

  @override
  double dx(double time) => velocity;

  @override
  bool isDone(double time) => false;
}
