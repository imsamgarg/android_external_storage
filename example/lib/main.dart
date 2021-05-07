import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_external_storage/android_external_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _externalStoragePath = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String? path;

    try {
      path = await AndroidExternalStorage.getRootDirectory();
    } on PlatformException {
      path = 'Failed to get Storage Path.';
    }

    if (!mounted) return;

    setState(() {
      _externalStoragePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AndroidExternalStorage example app'),
        ),
        body: Center(
          child: Text('Path:- $_externalStoragePath'),
        ),
      ),
    );
  }
}
