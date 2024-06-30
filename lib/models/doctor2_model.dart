

class Doctor2Model {
  final String doctorName;
  final int pendingAppointments;
  final int completedAppointments;
  final List<Appointment> appointments;

  Doctor2Model({
    required this.doctorName,
    required this.pendingAppointments,
    required this.completedAppointments,
    required this.appointments,
  });

  factory Doctor2Model.fromJson(Map<String, dynamic> json) {
    return Doctor2Model(
      doctorName: json['doctorName'] ?? '',
      pendingAppointments: json['pendingAppointment'] ?? 0,
      completedAppointments: json['completedAppointment'] ?? 0,
      appointments: (json['patientList'] as List<dynamic>?)
          ?.map((item) => Appointment.fromJson(item))
          .toList() ?? [],
    );
  }
}

class Appointment {
  final String patientName;
  final int patientAge;
  final String time;
  final bool isCompleted;

  Appointment({
    required this.patientName,
    required this.patientAge,
    required this.time,
    required this.isCompleted,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      patientName: json['patientName'] ?? '',
      patientAge: json['patientAge'] ?? 0,
      time: json['time'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}
