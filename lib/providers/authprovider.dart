import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _doctorName = "John Doe";

  String get doctorName => _doctorName;

  void updateDoctorName(String name) {
    _doctorName = name;
    notifyListeners();
  }
}
