import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Text> _info = List.generate(10, (i) => Text('item $i'));
  List<Text> get getItem => _info;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'test',
        home: Scaffold(
          body: GridView.count(
            crossAxisCount: 6,
            crossAxisSpacing: 2,
            children: _info,
          ),
        ));
  }
}

// class TestArr extends StatelessWidget {
//   final List<ListTile> data;

//   TestArr({Key key, @required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView(
//       children: this.data,
//     ));
//   }
// }
