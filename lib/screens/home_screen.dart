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
     // appBar: AppBar(
       // backgroundColor: Color.fromRGBO(255, 105, 180, 1),
      //),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //TODO: eventually we are gonna have to just design a logo in photoshop instead of hardcoding one with flutter widgets
            Center(
              child: Text(
                  'Felinder',
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(255, 105, 180, 1),
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