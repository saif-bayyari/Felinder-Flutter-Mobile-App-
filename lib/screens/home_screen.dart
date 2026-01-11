import 'package:flutter/material.dart';
import '../routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneNumber = "";
    var email = "";

    // Return just the Scaffold, not MaterialApp
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: Icon(Icons.phone, color: Colors.teal),
                title: TextButton(
                  child: const Text('SIGN IN WITH PHONE NUMBER'),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.phoneInput);
                  },
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 25,
                    child: Image.asset("lib/icons/google-color-icon.png"),
                  ),
                ),
                title: TextButton(
                  child: const Text('SIGN IN WITH GOOGLE'),
                  onPressed: () {
                    print("test");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}