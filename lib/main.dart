
import 'package:flutter/material.dart';
import 'routes.dart';
//Felinder: Dating App For Cats



//The main function is the starting point for all of our flutter apps.
void main() {
  runApp(Felinder());
}

class Felinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Felinder',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      routes: Routes.getRoutes(),
    );
  }
}