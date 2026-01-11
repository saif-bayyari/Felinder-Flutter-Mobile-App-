import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/phone_input_screen.dart';

class Routes {
  static const String home = '/home';
  static const String phoneInput = '/phoneInput';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomeScreen(),
      phoneInput: (context) => PhoneInput(),
    };
  }
}