import 'package:flutter/widgets.dart';

void main() {
  runApp(
    WidgetsApp(
      color: Color(0xffffffff),
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, _) {
            return Center(child: Text("Hello World"));
          },
        );
      },
    ),
  );
}
