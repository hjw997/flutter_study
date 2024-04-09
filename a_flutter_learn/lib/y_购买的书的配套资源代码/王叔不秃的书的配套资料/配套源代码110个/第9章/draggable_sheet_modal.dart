import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHome()));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomSheet Demo")),
      body: Align(
        alignment: Alignment(0, -0.5),
        child: ElevatedButton(
          child: Text("弹出底窗"),
          onPressed: () async {
            final result = await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => DraggableScrollableSheet(
                expand: false,
                builder: (context, ScrollController controller) {
                  return ListView.builder(
                    controller: controller,
                    itemCount: 100,
                    itemExtent: 50,
                    itemBuilder: (context, index) {
                      return Center(child: Text('Item $index'));
                    },
                  );
                },
              ),
            );
            print(result);
          },
        ),
      ),
    );
  }
}
