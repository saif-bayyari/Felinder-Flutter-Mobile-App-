// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  // Change this to your actual backend URL
  // For local development:
  // - Android emulator: 10.0.2.2:8080
  // - iOS simulator: localhost:8080
  // - Real device: your computer's IP address
  final String baseUrl = 'http://10.0.2.2:8080';

  // Test POST - Create a user
  Future<User?> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      print('Status: ${response.statusCode}');
      print('Response: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  // Test GET - Simple ping
  Future<bool> ping() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      print('Ping failed: $e');
      return false;
    }
  }
}