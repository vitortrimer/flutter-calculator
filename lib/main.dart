import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstNum;
  int secondNum;
  String textToDisplay = "";
  String res;
  String operation;

  void btnClicked(String value) {
    if (value == "C") {
      textToDisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
    } else if (value == "+" || value == "-" || value == "x" || value == "/") {
      firstNum = int.parse(textToDisplay);
      res = "";
      operation = value;
    } else if (value == "=") {
      secondNum = int.parse(textToDisplay);
      if (operation == "+") res = (firstNum + secondNum).toString();
      if (operation == "-") res = (firstNum - secondNum).toString();
      if (operation == "x") res = (firstNum * secondNum).toString();
      if (operation == "/") res = (firstNum ~/ secondNum).toString();
    } else {
      res = int.parse(textToDisplay + value).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  Widget customButton(String value) {
    return Expanded(
        child: OutlineButton(
      padding: EdgeInsets.all(25.0),
      child: Text(
        "$value",
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
      onPressed: () => btnClicked(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Calculator")),
      body: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                "$textToDisplay",
                style: TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("C"),
              customButton("0"),
              customButton("="),
              customButton("/"),
            ],
          )
        ]),
      ),
    );
  }
}
