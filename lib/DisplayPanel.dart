import 'dart:convert';

import 'package:flutter/material.dart';
import 'ButtonPanel.dart';
import 'package:http/http.dart' as http;

class DisplayPanel extends StatefulWidget {
  @override
  _DisplayPanel createState() => _DisplayPanel();
}

class _DisplayPanel extends State<DisplayPanel> {
  String result = '';

  List<String> expToStack(String exp) {
    List<String> stack = [];
    List<String> subExp = [];
    List<String> operatorStack = [];

    RegExp numRegex = new RegExp(r'(\d|\.)');

    for (int i = 0; i < exp.length; i++) {
      String c = exp[i];
      if (numRegex.hasMatch(c)) {
        subExp.add(c);
      } else if (c == '+' || c == '-') {
        if (subExp.length > 0) {
          stack.add(subExp.join(''));
          subExp = [];
        }
        if (operatorStack.length > 0) {
          while (operatorStack.length > 0) {
            stack.add(operatorStack.removeLast());
          }
        }
        operatorStack.add(c);
        // handles * and /
      } else if (c == '*' || c == '/') {
        if (subExp.length > 0) {
          stack.add(subExp.join(''));
          subExp = [];
        }
        if (operatorStack.length > 0) {
          String topElement = operatorStack[operatorStack.length - 1];
          if (topElement == '/' || topElement == "*") {
            stack.add(operatorStack.removeLast());
          }
        }
        operatorStack.add(c);
      }
      print(stack);
    }
    if (subExp.length > 0) {
      stack.add(subExp.join(''));
      print(stack);
    }

    while (operatorStack.length > 0) {
      stack.add(operatorStack.removeLast());
      print(stack);
    }
    return stack;
  }

  double evaluateStack(List<String> srcStack) {
    List calcStack = [];

    for (int i = 0; i < srcStack.length; i++) {
      String char = srcStack[i];
      if (isNumeric(char)) {
        calcStack.add(double.parse(char));
      } else {
        double val2 = calcStack.removeLast();
        calcStack.add(calcResult(char, calcStack.removeLast(), val2));
      }
    }

    return calcStack[0];
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  calcResult(String type, val1, val2) {
    switch (type) {
      case ('+'):
        {
          return val1 + val2;
        }
        break;

      case ('-'):
        {
          return val1 - val2;
        }
        break;

      case ('*'):
        {
          return val1 * val2;
        }
        break;

      default:
        {
          return val1 / val2;
        }
        break;
    }
  }

  void addArg(String arg) {
    if (arg == '+' || arg == '-' || arg == '*' || arg == '/') {
      if (result.length > 0) {
        setState(() {
          this.result += " $arg ";
        });
        // } else if (this.result.split(' ').length == 3) {
        //   setState(() {
        //     this.result += arg;
        //   });
      }
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

    if (result.length == 0) return;
    if (argsArray.length < 3) return;

    final String calcOperator = argsArray[1];
    final int val1 = int.parse(argsArray[0]);
    final int val2 = int.parse(argsArray[2]);

    List<String> parse =  expToStack(this.result);
    this.setArg(evaluateStack(parse).toString());
    // switch (calcOperator) {
    //   case ('+'):
    //     {
    //       int value = val1 + val2;
    //       this.setArg(value.toString());
    //     }
    //     break;
    //
    //   case ('-'):
    //     {
    //       int value = val1 - val2;
    //       this.setArg(value.toString());
    //     }
    //     break;
    //
    //   case ('*'):
    //     {
    //       int value = val1 * val2;
    //       this.setArg(value.toString());
    //     }
    //     break;
    //
    //   case ('/'):
    //     {
    //       double value = val1 / val2;
    //       this.setArg(value.toString());
    //     }
    //     break;
    //
    //   default:
    //     {
    //       this.setArg('invalid');
    //     }
    //     break;
    // }
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
