import 'package:flutter/material.dart';
import 'DisplayPanel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'calculator', home: DisplayPanel());
  }
}
