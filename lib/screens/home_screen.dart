import 'package:flutter/material.dart';
import '../routes.dart';
import '../custom_widgets/social_sign_in_card.dart';

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
            SocialSignInCard(
              method: SignInMethod.phone,
              onPressed: (){
                Navigator.pushNamed(context, Routes.phoneInput);
              }
            ),
            SocialSignInCard(
              method: SignInMethod.google,
              onPressed: () {
                Navigator.pushNamed(context, Routes.googleInput);
              }
            ),
          ],
        ),
      ),
    );
  }
}