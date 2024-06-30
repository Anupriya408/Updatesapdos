import 'package:first_project/models/doctor_model.dart';
import 'package:first_project/models/slot_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorRepository {
  final String baseUrl = 'https://sapdos-api-v2.azurewebsites.net/api';

  Future<Doctor> getDoctorDetail(String doctorId) async {
    final response = await http.get(Uri.parse('$baseUrl/Doctor/$doctorId'));

    if (response.statusCode == 200) {
      return Doctor.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load doctor details');
    }
  }

  Future<List<Slot>> getAvailableSlots(String doctorId) async {
    final response = await http.get(Uri.parse('$baseUrl/Patient/GetAvailbleSlot?doctorId=$doctorId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((slot) => Slot.fromJson(slot)).toList();
    } else {
      throw Exception('Failed to load available slots');
    }
  }

  Future<void> bookAppointment(String slotId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Patient/BookAppointment'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'slotId': slotId}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to book appointment');
    }
  }
}



