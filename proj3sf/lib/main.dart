import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Spanish Numbers",
      home: MyButton(),
    ));

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int counter = 0;
  String coun = "";
  List<String> spanishNumbers = [
    "",
    "Uno",
    "Dos",
    "Tres",
    "Cuatro",
    "Cinco",
    "seis",
    "seite",
    "ocho",
    "nueve",
    "Dietz",
    "Spanish Numbers"
  ];
  String defaultText = "Spanish Numbers";
  void displaynumber() {
    setState(() {
      defaultText = spanishNumbers[counter].toUpperCase();
      coun = counter.toString();
      counter++;
      if (counter == 12) {
        counter = 0;
        coun = "Spanish Numbers";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(defaultText),
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                defaultText,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                coun,
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => displaynumber(),
        child: Icon(Icons.add),
      ),
    );
  }
}
