import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // 图片数据，用base64形式保存为字符串
  final String data =
      r'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC/xhBQAAAA'
      'FzUkdCAK7OHOkAAADJUExURSoyNUhPUENJSy01OCUtMDE5PDQ8PxwmKSgwM0pQUiYuMkBHS'
      'Tc+QT5FRzlAQ0xTVS84OjM6PRojJyIrLnd6ekFISkNKTSszNoKFhY+QkPXy7kZMTlFXWB4o'
      'KxQdIQ4XHGVpa15jZL6+vPXv7Pv08OHf3P///zxCRldcXWlsbIiLiqmrqpiammxwce3q53x'
      '+f/jz7/328u7p5BgiJnJ0dVtiYmFlZs/PznR0dNHPzf/9+JiYmOLg3a+vrvv8/KWlpcTDwe'
      '/r6bW2tiwau5YAAADdSURBVBgZBQAFcoNAcOE4RQ5fXANEG0Ld5f+P6gAoIrXNKHO19AUgC'
      'FZ5RFiWQPQqRwDQikHT8qhpQ+FIR0FpR22anT7PHTa1mRLQKuyHu92tmE66hnKBhHuvb+u2'
      '7eZ5cEPXBMbjcdyK2zSs84WzBJDn4zr+Trn/93VUNAXKs+Lj58oUx+cMggQ8/vieZ5cujvt'
      '4rzwTjAjl8eX6nR/OJbFMG6TDrT5+2h8eOnK/lAF4mnJiMstJkVO9CMDEcFRYRzxUTNpEgB'
      'C24QaU+oErXRQICIomhjSkUVIFiP+YExUHb1U6+QAAAABJRU5ErkJggg==';

  // 转码至Uint8List类型
  late final bytes = base64Decode(data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用MemoryImage直接读取字节信息"),
      ),
      body: Image(image: MemoryImage(bytes)),
    );
  }
}
