import 'package:flutter/material.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
    title: "Flutter App",
    theme: ThemeData(primaryColor: Colors.green[200],accentColor: Colors.green[200]),
    home: Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Flutter Project"),
      ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("I an Text Line One"),
          Text("I an Text Line Second"),
          ElevatedButton(onPressed:(){},
          child: Text("SignUp!"),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green[200]),foregroundColor: MaterialStateProperty.all<Color>(Colors.black),),)
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
        
      ),
    ),
  );      
    
  }
}