import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String buttonNum;
  final Function callback;

  CalcButton({Key key, @required this.buttonNum, @required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.blue[900],
        onTap: () {
          this.callback(this.buttonNum);
        },
        child: Ink(
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.1415,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                this.buttonNum,
                style: TextStyle(fontSize: 40, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}
