import 'package:flutter/material.dart';
import 'package:first_project/models/doctor2_model.dart';
import 'package:first_project/repositories/doctor/doctor2_repository.dart' as docRepo;

class AuthProvider extends ChangeNotifier {
  final docRepo.Doctor2Repository doctor2Repository;

  AuthProvider({required this.doctor2Repository});

  String _doctorName = "John Doe";
  Doctor2Model? _dashboard;

  String get doctorName => _doctorName;
  Doctor2Model? get dashboard => _dashboard;

  Future<void> fetchDashboard() async {
    try {
      final data = await doctor2Repository.getDoctorDashboard();
      print('API Response: $data'); 

      if (data != null) {
        _dashboard = Doctor2Model.fromJson(data);
        _doctorName = _dashboard?.doctorName ?? "John Doe";
        notifyListeners();
      } else {
        print('Failed to fetch dashboard data');
      }
    } catch (e) {
      print('Error fetching dashboard data: $e');
    }
  }

  void updateDoctorName(String name) {
    _doctorName = name;
    notifyListeners();
  }
}
