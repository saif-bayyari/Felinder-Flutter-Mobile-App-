// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
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