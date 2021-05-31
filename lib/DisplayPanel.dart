import 'package:flutter/material.dart';
import 'ButtonPanel.dart';

class DisplayPanel extends StatefulWidget {
  @override
  _DisplayPanel createState() => _DisplayPanel();
}

class _DisplayPanel extends State<DisplayPanel> {
  String result = '';

  void addArg(String arg) {
    if (arg == '+' || arg == '-' || arg == '*' || arg == '/') {
      if (result.length > 0)
        setState(() {
          this.result += " $arg ";
        });
    } else {
      setState(() {
        this.result += arg;
      });
    }
  }

  void clearArg(String arg) {
    setState(() {
      this.result = '';
    });
  }

  void setArg(String arg) {
    setState(() {
      this.result = arg;
    });
  }

  void performCalculation(String arg) {
    final List<String> argsArray = this.result.split(' ');

    if (argsArray.length < 3) return;

    final String calcOperator = argsArray[1];
    final int val1 = int.parse(argsArray[0]);
    final int val2 = int.parse(argsArray[2]);

    switch (calcOperator) {
      case ('+'):
        {
          int value = val1 + val2;
          this.setArg(value.toString());
        }
        break;

      case ('-'):
        {
          int value = val1 - val2;
          this.setArg(value.toString());
        }
        break;

      case ('*'):
        {
          int value = val1 * val2;
          this.setArg(value.toString());
        }
        break;

      case ('/'):
        {
          double value = val1 / val2;
          this.setArg(value.toString());
        }
        break;

      default:
        {
          this.setArg('invalid');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: ListView(
            children: [
              Container(
                child: Text(
                  '$result',
                  style: TextStyle(fontSize: 60),
                  textAlign: TextAlign.right,
                ),
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
              ),
              ButtonPanel(
                  callback: this.addArg,
                  clear: this.clearArg,
                  calculate: this.performCalculation)
            ],
          ),
        ),
      ),
    );
  }
}
