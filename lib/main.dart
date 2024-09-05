import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _sharedText = "No text shared";

  @override
  void initState() {
    super.initState();
    _getSharedText();
  }

  Future<void> _getSharedText() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sharedText = prefs.getString('sharedText') ?? "No text shared";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shared Text from LINE'),
        ),
        body: Center(
          child: Text(_sharedText),
        ),
      ),
    );
  }
}
