import "dart:math";
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> assetlist = [
    "assets/one.png",
    "assets/two.png",
    "assets/three.png",
    "assets/four.png",
    "assets/five.png",
    "assets/six.png",
  ];
  String diceImagecurrent;
  String diceImagecurrent2;
  @override
  void initState() {
    super.initState();
    setState(() {
      diceImagecurrent = assetlist[0];
      diceImagecurrent2 = assetlist[0];
    });
  }

  void rollDice() {
    setState(() {
      int random = Random().nextInt(assetlist.length);
      diceImagecurrent = assetlist[random];
      int random2 = Random().nextInt(assetlist.length);
      diceImagecurrent2 = assetlist[random2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dice Roller",
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                diceImagecurrent,
                scale: 2,
              ),
              Padding(padding: EdgeInsets.all(16.0)),
              Image.asset(
                diceImagecurrent2,
                scale: 2,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: rollDice,
        label: Text(
          "Roll Dice !",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        icon: Icon(
          Icons.refresh_rounded,
          size: 30,
          color: Colors.black,
        ),
        elevation: 10.2,
        splashColor: Colors.white,
        focusColor: Colors.yellow[800],
        backgroundColor: Colors.yellow[800],
        hoverColor: Colors.yellow[800],
      ),
    );
  }
}
