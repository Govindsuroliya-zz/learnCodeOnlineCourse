import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//TODO : import images.
  AssetImage circle = AssetImage("assets/images/circle.png");
  AssetImage lucky = AssetImage("assets/images/rupee.png");
  AssetImage unlucky = AssetImage("assets/images/sadFace.png");

//TODO : get an array.
  List<String> itemArray;
  int luckyNumber;
  int counter = 5;
//TODO : init array with 25 elements.
  void initState() {
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
    });
  }

//TODO : define a getImaage method.
  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return circle;
  }

//TODO : play game method.
  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
  }

//TODO : ShowAll.
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

//TODO : Reset all.
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      counter = 5;
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Scratch & Win"),
        centerTitle: true,
        elevation: 0.0,
        leading: Center(
          child: Text(
            counter.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.check_circle), onPressed: () => this.showAll()),
          IconButton(
              icon: Icon(Icons.refresh_rounded),
              onPressed: () => this.resetGame())
        ],
      ),
      body: Container(
        color: Colors.pink,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 500.0,
                height: 40.0,
                child: Container(
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "Project By @govindsuroliya",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(top: 90),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemCount: itemArray.length,
                    itemBuilder: (context, i) => SizedBox(
                        height: 50,
                        width: 50,
                        child: MaterialButton(
                            onPressed: () {
                              this.playGame(i);
                              setState(() {
                                this.counter = this.counter - 1;
                                if (counter == 0 && luckyNumber != i) {
                                  showAlertDialog(context);
                                } else if (luckyNumber == i) {
                                  showWinDialog(context);
                                }
                              });
                            },
                            color: Colors.pink[100],
                            child: Image(image: this.getImage(i)))),
                  ),
                ),
              )),
              SizedBox(
                width: 500.0,
                height: 50.0,
                child: Container(
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "learncodeonline.in",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  // this my Game Over AlertBox...
  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          setState(() {
            this.resetGame();
            Navigator.of(context).pop();
          });
        },
        child: Text("Reset",
            style: TextStyle(color: Colors.pink[50], fontSize: 20)));

    AlertDialog overDialog = AlertDialog(
      title: Text(
        "Scratch & Win",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.pink,
      content: Text("This Game is Over", style: TextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return overDialog;
        });
  }

  showWinDialog(BuildContext context) {
    Widget okButton = TextButton(
        onPressed: () {
          setState(() {
            this.resetGame();
            Navigator.of(context).pop();
          });
        },
        child: Text("Reset",
            style: TextStyle(color: Colors.pink[50], fontSize: 20)));

    AlertDialog overDialog = AlertDialog(
      title: Text(
        "Scratch & Win",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.pink,
      content: Text("Hey There ,You Win This.\nPlease Reset the Game.",
          style: TextStyle(color: Colors.white)),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return overDialog;
        });
  }
}
