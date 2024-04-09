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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AlertDialog Demo")),
      body: Align(
        alignment: Alignment(0, 0.5),
        child: ElevatedButton(
          child: Text("弹出对话框"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return VolumeControlDialog("音量");
              },
            );
          },
        ),
      ),
    );
  }
}

class VolumeControlDialog extends StatefulWidget {
  final String title;

  const VolumeControlDialog(this.title);

  @override
  _VolumeControlDialogState createState() => _VolumeControlDialogState();
}

class _VolumeControlDialogState extends State<VolumeControlDialog> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: IntrinsicHeight(
        child: Slider(
          value: _value,
          onChanged: (v) {
            setState(() => _value = v);
          },
        ),
      ),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () => Navigator.of(context).pop(_value),
        )
      ],
    );
  }
}
