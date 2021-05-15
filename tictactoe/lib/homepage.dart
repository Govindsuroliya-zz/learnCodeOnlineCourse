import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  TODO : link up all the Assets.
  AssetImage cross = AssetImage("assets/images/cross.png");
  AssetImage circle = AssetImage("assets/images/circle.png");
  AssetImage edit = AssetImage("assets/images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;

// TODO : Initiazlie the state of box with empty.
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
      this.message = "Welcame";
    });
  }

// TODO : Play Game method.
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

// TODO : Reset Game Method.
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
      this.message = "Welcame";
    });
  }

// TODO : get image Method.
  AssetImage getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;
        break;
      case ("cross"):
        return cross;
        break;
      case ("circle"):
        return circle;
        break;
    }
  }

// TODO : Check for win Logic.
  checkWin() {
    // 0,1,2
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = "${this.gameState[0]} Win";
      });
    }
    //3,4,5
    else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = "${this.gameState[3]} Win";
      });
    }
    //6,7,8
    else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[6]} Win";
      });
    }
    //0,3,6
    else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[0]} Win";
      });
    }
    //1,4,7
    else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = "${this.gameState[1]} Win";
      });
    }
    //2,5,8
    else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[2]} Win";
      });
    }
    //0,4,8
    else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[0]} Win";
      });
    }
    //2,4,6
    else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[2]} Win";
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                resetGame();
              }),
        ),
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
              fontFamily: "TicTacToe",
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed: () {
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.gameState[i]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 110),
                child: Text(
                  this.message.toUpperCase(),
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  "Project By @govindsuroliya",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}
