import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter", style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text(
          "hello",
          style: TextStyle(color: Colors.orange, fontSize: 30),
        ),
      ),
    ),
  ));
}
