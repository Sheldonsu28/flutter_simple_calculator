import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'test',
        home: Scaffold(
          body: GridView.count(
            crossAxisCount: 6,
            crossAxisSpacing: 2,
            children: List.generate(100, (i) => Text('item $i')),
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
