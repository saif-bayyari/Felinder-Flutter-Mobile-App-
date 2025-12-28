import 'package:flutter/material.dart';

//Felinder: Dating App For Cats

//The main function is the starting point for all of our flutter apps.
void main() {
  runApp(Felinder());
}

class Felinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.teal,


        body: SafeArea(
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0)
            children: [
              Container(width: 100, color: Colors.red),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 100, height: 100, color: Colors.yellow),
                  Container(width: 100, height: 100, color: Colors.green)
                ],
              ),
              Container(width: 100, color: Colors.blue)


            ],
            ),
          ),
        ),
    );
  }
}
