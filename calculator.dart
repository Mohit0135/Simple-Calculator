import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int num1 = 0;
  int num2 = 0;
  String texttodisplay = '';
  String res = '';
  String operator= '';

  void btnclicked(String btnvalue) {
    if (btnvalue == 'C') {
      texttodisplay = '';
      num1 = 0;
      num2 = 0;
      res = '';
    }
    else if (
    btnvalue == '+' ||
        btnvalue == '-' ||
        btnvalue == 'x' ||
        btnvalue == '/') {
      num1 = int.parse(texttodisplay);
      res = '';
      operator = btnvalue;
    }
    else if (btnvalue == '=') {
      num2 = int.parse(texttodisplay);
      if (operator == '+') {
        res = (num1 + num2).toString();
      }
      if (operator == '-') {
        res = (num1 - num2).toString();
      }
      if (operator == 'x') {
        res = (num1 * num2).toString();
      }
      if (operator== '/') {
        res = (num1 ~/ num2).toString();
      }
    }
    else {
      res = int.parse(texttodisplay + btnvalue).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  // button class start
  Widget custombutton(String btnvalue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20),
        onPressed: () => btnclicked(btnvalue),
        child: Text(
          '$btnvalue',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
// button class end

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$texttodisplay',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('C'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('x'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('0'),
                custombutton('+'),
                custombutton('-'),
                custombutton('='),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

