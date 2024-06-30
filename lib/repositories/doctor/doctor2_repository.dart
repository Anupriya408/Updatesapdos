import 'dart:convert';
import 'package:http/http.dart' as http;

class Doctor2Repository {
  static const String apiUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

  Future<Map<String, dynamic>?> getDoctorDashboard() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/Doctor/GetDoctorDashbord'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Failed to load dashboard data with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching dashboard data: $e');
      return null;
    }
  }
}
