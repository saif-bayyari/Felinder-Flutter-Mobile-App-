import 'package:flutter/material.dart';
import '../routes.dart';
import '../custom_widgets/social_sign_in_card.dart';
import '../services/api_service.dart';
import '../models/user.dart';

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
                  fontFamily: "Pacifico",
                ),
              ),
            ),
            SocialSignInCard(
              method: SignInMethod.phone,
              onPressed: () {
                Navigator.pushNamed(context, Routes.phoneInput);
              },
            ),
            SocialSignInCard(
              method: SignInMethod.google,
              onPressed: () {
                Navigator.pushNamed(context, Routes.googleInput);
              },
            ),
            SocialSignInCard(
              method: SignInMethod(
                buttonText: "Mesh Gradient Test",
                iconBuilder: () => Icon(Icons.scatter_plot_outlined),
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.meshGradientTest);
              },
            ),

            SocialSignInCard(
              method: SignInMethod(
                buttonText: "Backend Test",
                iconBuilder: () => Icon(Icons.plus_one),
              ),
              onPressed: () async {
                final api = ApiService();

                final testUser = User(
                  id: 'test-123',
                  email: 'test@example.com',
                  firstName: 'John',
                  lastName: 'Doe',
                  createdAt: DateTime.now(),
                  role: UserRole.user,
                );

                final success = await api.testCreateUser(testUser);

                if (success) {
                  print('Request sent! Check RequestBin to see it.');
                } else {
                  print('Something went wrong.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
