

import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final String time;
  final String patientName;
  final int patientAge;

  AppointmentCard({required this.time, required this.patientName, required this.patientAge});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(Icons.access_time),
        title: Text('$time - $patientName'),
        subtitle: Text('Age: $patientAge'),
      ),
    );
  }
}
