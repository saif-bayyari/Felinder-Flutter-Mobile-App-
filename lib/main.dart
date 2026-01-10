
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
            '',
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisSize: MainAxisSize.min,
            children: [


              Center(
                child: Text(
                    'Felinder',

                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontFamily: "Pacifico"
                    )
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Column(
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      leading:Icon(Icons.phone, color: Colors.teal),
                      title:
                      TextButton(
                        child: const Text('SIGN IN WITH PHONE NUMBER'),
                        onPressed: () {
                          // Action for the first button
                          print("test");
                        },
                      ),
                    ),
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      leading:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 25,
                          child: Image.asset("lib/icons/google-color-icon.png"),
                        ),
                      )
                      
                      ,
                      title:
                      TextButton(
                        child: const Text('SIGN IN WITH GOOGLE'),
                        onPressed: () {
                          // Action for the first button
                          print("test");
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
