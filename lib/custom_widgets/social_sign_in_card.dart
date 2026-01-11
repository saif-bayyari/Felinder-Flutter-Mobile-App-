import 'package:flutter/material.dart';
import '../../routes.dart';

// Define your sign-in methods as a config
class SignInMethod {
  final String buttonText;
  final Widget Function() iconBuilder;

  const SignInMethod({
    required this.buttonText,
    required this.iconBuilder,
  });

  static final google = SignInMethod(
    buttonText: 'SIGN IN WITH GOOGLE',
    iconBuilder: () => Image.asset("lib/icons/google-color-icon.png"),
  );

  static final email = SignInMethod(
    buttonText: 'SIGN IN WITH EMAIL',
    iconBuilder: () => Icon(Icons.email, color: Colors.red),
  );

  static final phone = SignInMethod(
    buttonText: 'SIGN IN WITH PHONE',
    iconBuilder: () => Icon(Icons.phone, color: Colors.green),
  );
}

class SocialSignInCard extends StatelessWidget {
  final SignInMethod method;
  final VoidCallback onPressed;

  const SocialSignInCard({
    required this.method,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.center,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 25,
            width: 25,
            child: method.iconBuilder(),
          ),
        ),
        title: TextButton(
          child: Text(method.buttonText),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

