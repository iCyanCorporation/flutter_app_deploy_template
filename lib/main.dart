import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Shared Data Example')),
        body: SharedTextWidget(),
      ),
    );
  }
}

class SharedTextWidget extends StatefulWidget {
  @override
  _SharedTextWidgetState createState() => _SharedTextWidgetState();
}

class _SharedTextWidgetState extends State<SharedTextWidget> {
  String _sharedText = 'No data shared';

  static const platform = MethodChannel('com.icyan.todolist/share');

  @override
  void initState() {
    super.initState();
    _getSharedText();
  }

  Future<void> _getSharedText() async {
    try {
      final sharedText = await platform.invokeMethod<String>('getSharedText');
      if (sharedText != null) {
        setState(() {
          _sharedText = sharedText;
        });
      }
    } on PlatformException catch (e) {
      setState(() {
        _sharedText = "Failed to get shared text: '${e.message}'";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(_sharedText));
  }
}
