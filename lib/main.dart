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
          title: const Text('Felinder! A Dating Platform For Cats', style: TextStyle(fontSize: 20)),
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
        body: Column(
          children: [
            AutoSizeText(
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
              //image: AssetImage('images/happy-tabby-cat.png'),
              alignment: Alignment.centerRight,
              image: NetworkImage(
                "https://paradepets.com/.image/c_fill,w_1200,h_1200,g_faces:center/NTowMDAwMDAwMDAwMDI4ODAw/shutterstock_2502425875.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
