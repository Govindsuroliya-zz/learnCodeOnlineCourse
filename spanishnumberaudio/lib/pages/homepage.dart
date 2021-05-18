import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'components/helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();
  List<NumberAudio> numberlist = [
    NumberAudio("audio/one.wav", Colors.red, "One"),
    NumberAudio("audio/two.wav", Colors.blue, "Two"),
    NumberAudio("audio/three.wav", Colors.green, "Three"),
    NumberAudio("audio/four.wav", Colors.yellow, "Four"),
    NumberAudio("audio/five.wav", Colors.pink, "Five"),
    NumberAudio("audio/six.wav", Colors.purple, "Six"),
    NumberAudio("audio/seven.wav", Colors.orange, "Seven"),
    NumberAudio("audio/eight.wav", Colors.lime, "Eight"),
    NumberAudio("audio/nine.wav", Colors.grey, "Nine"),
    NumberAudio("audio/ten.wav", Colors.brown, "Ten"),
  ];
  play(String uri) async {
    await audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Spanish Number",
                        style: TextStyle(fontSize: 34, fontFamily: "Ubuntu"),
                      ),
                      Text(
                        "Audio",
                        style: TextStyle(fontSize: 30, fontFamily: "Ubuntu"),
                      ),
                    ],
                  ),
                  Image.asset("assets/images/logo.png")
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.0,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) => SizedBox(
                    height: 100,
                    width: 200,
                    child: MaterialButton(
                      onPressed: () {
                        play(numberlist[index].audioUri);
                      },
                      child: Text(
                        "${numberlist[index].buttonText}",
                        style: TextStyle(fontFamily: "Ubuntu", fontSize: 25),
                      ),
                      color: numberlist[index].buttonColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
