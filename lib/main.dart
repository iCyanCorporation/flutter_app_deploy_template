import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel('com.icyan.todolist.share');
  String _sharedText = '';

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_handleMethod);
  }

  Future<void> _handleMethod(MethodCall call) async {
    if (call.method == "receiveText") {
      setState(() {
        _sharedText = call.arguments;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Received LINE Message'),
        ),
        body: Center(
          child: Text(
            _sharedText.isNotEmpty ? _sharedText : 'No message received yet',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
