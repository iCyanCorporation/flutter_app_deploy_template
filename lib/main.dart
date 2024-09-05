import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this line
import 'dart:async';

Future<String> getSharedText() async {
  const platform = MethodChannel('com.icyan.todolist/share');
  try {
    final sharedText = await platform.invokeMethod<String>('getSharedText');
    return sharedText ?? 'No data shared';
  } on PlatformException catch (e) {
    print("Failed to get shared text: '${e.message}'.");
    return 'Failed to get shared text';
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Shared Data Example')),
        body: FutureBuilder<String>(
          future: getSharedText(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return Text('Shared text: ${snapshot.data}');
          },
        ),
      ),
    );
  }
}
