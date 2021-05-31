import 'package:flutter/material.dart';
import 'button.dart';

class ButtonPanel extends StatelessWidget {
  final Function callback;
  final Function clear;
  final Function calculate;

  ButtonPanel(
      {Key key,
      @required this.callback,
      @required this.clear,
      @required this.calculate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueAccent[400],
        child: Column(
          children: [
            Row(
              children: [
                CalcButton(buttonNum: '1', callback: this.callback),
                CalcButton(buttonNum: '2', callback: this.callback),
                CalcButton(buttonNum: '3', callback: this.callback),
                CalcButton(buttonNum: 'C', callback: this.clear),
              ],
            ),
            Row(
              children: [
                CalcButton(buttonNum: '4', callback: this.callback),
                CalcButton(buttonNum: '5', callback: this.callback),
                CalcButton(buttonNum: '6', callback: this.callback),
                CalcButton(buttonNum: '/', callback: this.callback),
              ],
            ),
            Row(
              children: [
                CalcButton(buttonNum: '7', callback: this.callback),
                CalcButton(buttonNum: '8', callback: this.callback),
                CalcButton(buttonNum: '9', callback: this.callback),
                CalcButton(buttonNum: '*', callback: this.callback),
              ],
            ),
            Row(
              children: [
                CalcButton(buttonNum: '0', callback: this.callback),
                CalcButton(buttonNum: '-', callback: this.callback),
                CalcButton(buttonNum: '+', callback: this.callback),
                CalcButton(buttonNum: '=', callback: this.calculate),
              ],
            ),
          ],
        ));
  }
}
