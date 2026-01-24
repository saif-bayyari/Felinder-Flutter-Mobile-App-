// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';


class ApiService {

  //THIS IS HOW YOU PROPERLY WRITE THE SERVER  ENDPOINT:
  //HTTP://LOCALHOST:[PORT NUMBER}
  //That's it. Do not put a slash after the number.
  //Note: localhost is for ios simulator environments, android uses a different ip addr
  final String baseUrl = 'http://localhost:8000';

  Future<User?> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<User?> getUser(String id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$id'),
      );

      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<bool> ping() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/health'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}

class ApiServiceTest {
  // Paste your RequestBin URL here
  final String baseUrl = 'https://eocve3jve6ye1g2.m.pipedream.net'; // <-- YOUR URL

  Future<bool> testCreateUser(User user) async {
    try {
      final jsonData = user.toJson();

      print('Sending: $jsonData');  // See what you're sending

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(jsonData),
      );

      print('Status: ${response.statusCode}');

      // RequestBin returns 200 if it received your request
      return response.statusCode == 200;

    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}