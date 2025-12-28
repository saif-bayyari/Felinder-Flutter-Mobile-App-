import 'package:auto_size_text/auto_size_text.dart';
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
        appBar: AppBar(
          title: const Text(
            'Felinder! A Dating Platform For Cats',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Color.fromRGBO(255, 105, 180, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                print("hello saif");
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(

              //main axis alignment basically is saying "where does the column start attaching things relative to?"
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              //mainAxisSize: MainAxisSize.min,
              children: [

                Container(width: 100, height: 100, color: Colors.red),
                Container(width: 100, height: 100, color: Colors.green),
                Container(width: 100, height: 100, color: Colors.yellow),
                Center(
                child: AutoSizeText(
                  'Felinder',

                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(
                    fontFamily: 'Pacifico',
                    color: const Color.fromRGBO(255, 105, 180, 1),
                  ),
                  maxLines: 1,
                  minFontSize: 70,
                  maxFontSize: 120,
                ),
              ),
              Container(width: 100, height: 100, color: Colors.red),
                Container(width: 100, height: 100, color: Colors.blue)
              ]
          ),
        ),
      ),
    );
  }
}