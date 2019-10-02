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
  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Flutter Calculator")),
      body: Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Row(
            children: <Widget>[
              customButton("1"),
              customButton("2"),
              customButton("3"),
              customButton("%"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("4"),
              customButton("5"),
              customButton("6"),
              customButton("X"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton("7"),
              customButton("8"),
              customButton("9"),
              customButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              customButton(""),
              customButton(""),
              customButton(""),
              customButton("+"),
            ],
          )
        ]),
      ),
    );
  }
}
