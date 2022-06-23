import 'package:calulator_app/calulator_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalulatorApp());
}

class CalulatorApp extends StatelessWidget {
  const CalulatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calulator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalulatorPage(),
    );
  }
}
