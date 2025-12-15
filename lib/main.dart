import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

//Felinder: Dating App For Cats

//The main function is the starting point for all of our flutter apps.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Felinder: A Dating Platform For Cats'),
          backgroundColor: Color.fromRGBO(255, 105, 180, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show Snackbar',
              onPressed: () {
                print("hello");
              },
            ),
          ],
        ),
        body: Column(
          children:[AutoSizeText(
            'Felinder',

            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Color.fromRGBO(255, 105, 180, 1),
              fontSize: 48,
            ),

            maxLines: 1,
            minFontSize: 20,
          ),
            Image(
              image: NetworkImage("https://paradepets.com/.image/c_fill,w_1200,h_1200,g_faces:center/NTowMDAwMDAwMDAwMDI4ODAw/shutterstock_2502425875.jpg"),
            ),
        ],
        ),
      ),
    ),
  );
}
