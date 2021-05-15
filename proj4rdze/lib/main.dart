import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BG Changer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.yellow,
    Colors.black,
    Colors.pink,
    Colors.white,
    Colors.grey,
    Colors.amber,
    Colors.lime,
  ];
  var currentcolor = Colors.white;
  var forcolor = Colors.black;
  setRamdomColor() {
    var rnd = Random().nextInt(colors.length);
    setState(() {
      currentcolor = colors[rnd];
      if (colors[rnd] == Colors.black) {
        forcolor = Colors.white;
      } else {
        forcolor = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Ramdom Color",
          style: TextStyle(color: forcolor),
        ),
        centerTitle: true,
        backgroundColor: currentcolor,
      ),
      body: Container(
        color: currentcolor,
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(forcolor),
              elevation: MaterialStateProperty.all<double>(5.0),
              backgroundColor: MaterialStateProperty.all<Color>(currentcolor),
              foregroundColor: MaterialStateProperty.all<Color>(forcolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.1))),
            ),
            onPressed: () {
              setRamdomColor();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Change it!",
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
