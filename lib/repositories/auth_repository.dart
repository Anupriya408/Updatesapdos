import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepository with ChangeNotifier {
  static const String apiUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

  Future<bool> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/Credentials/Register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Registration successful
        return true;
      } else {
      
        print('Registration failed with: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error registering: $e');
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/Credentials/Login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        
        print('Login failed with: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error signing in: $e');
      return false;
    }
  }
}
