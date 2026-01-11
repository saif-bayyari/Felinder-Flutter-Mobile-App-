import 'package:flutter/material.dart';
import 'screens/mesh_gradient_test.dart';
import 'screens/home_screen.dart';
import 'screens/phone_input_screen.dart';
import 'screens/google_input_screen.dart';

class Routes {
  static const String home = '/home';
  static const String phoneInput = '/phoneInput';
  static const String googleInput='/googleInput';
  static const String meshGradientTest='/meshGradientTest';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomeScreen(),
      phoneInput: (context) => PhoneInput(),
      googleInput:(context)=>GoogleInput(),
      meshGradientTest:(context)=>MeshGradientTest()
    };
  }
}